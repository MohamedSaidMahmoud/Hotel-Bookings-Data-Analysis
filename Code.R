# Check for missing values in the 'market_segment' column
sum(is.na(hotel_bookings$market_segment))

# Check for any unique or irrelevant values in the 'market_segment' column
unique(hotel_bookings$market_segment)

# Remove rows where 'market_segment' is "Undefined"
hotel_bookings_clean <- hotel_bookings[hotel_bookings$market_segment != "Undefined", ]

# Count the number of bookings per market segment
table(hotel_bookings_clean$market_segment)

install.packages("ggplot2")


library(ggplot2)

# Create a data frame with counts for plotting
market_segment_counts <- as.data.frame(table(hotel_bookings_clean$market_segment))
colnames(market_segment_counts) <- c("MarketSegment", "Count")

# Plot the bar chart
ggplot(market_segment_counts, aes(x = MarketSegment, y = Count, fill = MarketSegment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Number of Bookings by Market Segment",
       x = "Market Segment",
       y = "Number of Bookings") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Convert reservation_status_date to Date type
hotel_bookings_clean$reservation_status_date <- as.Date(hotel_bookings_clean$reservation_status_date, format="%m/%d/%Y")


#...............................................................................

library(dplyr)

# Extract year and month
hotel_bookings_clean <- hotel_bookings_clean %>%
  mutate(YearMonth = format(reservation_status_date, "%Y-%m"))

# Aggregate the number of bookings per market segment by month
booking_trends <- hotel_bookings_clean %>%
  group_by(YearMonth, market_segment) %>%
  summarise(BookingCount = n())

# View a sample of the aggregated data
head(booking_trends)

# Check the summary of booking_trends to ensure multiple observations
summary(booking_trends)

# Convert YearMonth to a factor
booking_trends$YearMonth <- factor(booking_trends$YearMonth, levels = unique(booking_trends$YearMonth))
ggplot(booking_trends, aes(x = YearMonth, y = BookingCount, color = market_segment, group = market_segment)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Booking Trends by Market Segment Over Time",
       x = "Date",
       y = "Number of Bookings") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(booking_trends, aes(x = YearMonth, y = BookingCount, fill = market_segment)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Booking Trends by Market Segment Over Time",
       x = "Date",
       y = "Number of Bookings") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#...............................................................................

# Aggregate average ADR by market segment
adr_comparison <- hotel_bookings_clean %>%
  group_by(market_segment) %>%
  summarise(AverageADR = mean(adr, na.rm = TRUE))

# Plot the average ADR by market segment
ggplot(adr_comparison, aes(x = market_segment, y = AverageADR, fill = market_segment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Daily Rate (ADR) by Market Segment",
       x = "Market Segment",
       y = "Average ADR") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#...............................................................................
install.packages("tidyr")

# Check the column names in the dataset
colnames(cancellation_summary)

# Check unique values in the reservation_status column
unique(hotel_bookings_clean$reservation_status)

library(tidyr)

# Create a summary table with cancellations and check-outs
cancellation_summary <- hotel_bookings_clean %>%
  group_by(market_segment, reservation_status) %>%
  summarise(BookingCount = n(), .groups = 'drop') %>%
  pivot_wider(names_from = reservation_status, values_from = BookingCount, values_fill = list(BookingCount = 0))

# Calculate cancellation rate
cancellation_summary$CancellationRate <- with(cancellation_summary, Canceled / (Check-Out+ Canceled))


# Plot cancellation rates
ggplot(cancellation_rates, aes(x = market_segment, y = CancellationRate, fill = market_segment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Cancellation Rate by Market Segment",
       x = "Market Segment",
       y = "Cancellation Rate") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#...............................................................................

# Aggregate ADR by customer type
adr_by_customer_type <- hotel_bookings_clean %>%
  group_by(customer_type) %>%
  summarise(AverageADR = mean(adr, na.rm = TRUE))

# Plot ADR by customer type
ggplot(adr_by_customer_type, aes(x = customer_type, y = AverageADR, fill = customer_type)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Daily Rate (ADR) by Customer Type",
       x = "Customer Type",
       y = "Average ADR") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#...............................................................................

# Calculate total revenue by market segment
revenue_by_segment <- hotel_bookings_clean %>%
  group_by(market_segment) %>%
  summarise(TotalRevenue = sum(adr, na.rm = TRUE))

# Plot total revenue by market segment
ggplot(revenue_by_segment, aes(x = market_segment, y = TotalRevenue, fill = market_segment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Total Revenue by Market Segment",
       x = "Market Segment",
       y = "Total Revenue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#...............................................................................

# Aggregate ADR by room type
adr_by_room_type <- hotel_bookings_clean %>%
  group_by(reserved_room_type) %>%
  summarise(AverageADR = mean(adr, na.rm = TRUE),
            TotalBookings = n())

# Plot ADR and bookings by room type
ggplot(adr_by_room_type, aes(x = reserved_room_type, y = AverageADR, fill = reserved_room_type)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Daily Rate (ADR) and Bookings by Room Type",
       x = "Room Type",
       y = "Average ADR") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#...............................................................................

# Aggregate ADR by the number of booking changes
adr_by_changes <- hotel_bookings_clean %>%
  group_by(booking_changes) %>%
  summarise(AverageADR = mean(adr, na.rm = TRUE))

# Plot ADR by booking changes
ggplot(adr_by_changes, aes(x = booking_changes, y = AverageADR, fill = as.factor(booking_changes))) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Daily Rate (ADR) by Number of Booking Changes",
       x = "Number of Booking Changes",
       y = "Average ADR") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))





