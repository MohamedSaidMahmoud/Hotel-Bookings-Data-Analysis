# Hotel Bookings Data Analysis

## Project Overview
This project analyzes hotel booking data to uncover trends and insights related to customer behavior, market segments, and revenue generation. Using data visualization and statistical techniques, the project provides actionable insights to improve operational efficiency and profitability.

## Dataset
- **Source:** Hotel bookings dataset.
- **Size:** Over 30 columns detailing booking information, customer demographics, and financial metrics.
- **Key Attributes:**
  - Booking details (e.g., `is_canceled`, `lead_time`, `reservation_status_date`).
  - Customer details (e.g., `adults`, `children`, `customer_type`).
  - Revenue and market segments (e.g., `adr`, `market_segment`).
- **Focus:** Understanding patterns in booking cancellations, revenue generation, and market trends.

## Goals of the Analysis
1. Analyze booking patterns by market segments.
2. Investigate revenue generation across customer types and market segments.
3. Identify factors influencing booking cancellations.
4. Evaluate trends in average daily rate (ADR) and room preferences.
5. Understand seasonal booking patterns and their impact on revenue.

## Methodology
### Data Cleaning:
- Removed missing and irrelevant values.
- Reformatted date columns for proper time-series analysis.

### Data Exploration:
- Analyzed unique values and distributions for key columns.
- Grouped data by market segment, customer type, and room type for insights.

### Visualization:
- Used bar charts, time-series plots, and heatmaps for insights.

## Key Findings
- **Market Segments:** Online TA dominates bookings, followed by Offline TA/TO and Direct bookings.
- **Revenue Generation:** Higher ADR observed for Direct bookings and Complementary segments.
- **Cancellations:** High cancellation rates in Group and Online TA bookings.
- **Room Preferences:** Certain reserved room types are highly preferred by customers with higher ADRs.
- **Seasonality:** Bookings and ADR peak during holiday seasons and weekends.

## Visualizations
1. **Market Segments vs. Booking Count:** A bar chart showing the distribution of bookings by segment.
2. **ADR by Market Segment:** Highlights segments with the highest average daily rate.
3. **Cancellations by Segment:** Visualizing the cancellation rate for each market segment.
4. **Revenue Trends:** Total revenue generated per segment.
5. **Customer Type vs. ADR:** Insights into spending behavior across customer groups.

## Tools Used
- R Programming Language
- ggplot2 for Visualization
- dplyr and tidyr for Data Manipulation

## Project Structure
- `README.md`: Project overview and details.
- `Data Analyses Project.R`: R script for data cleaning, exploration, and visualization.
- `hotel_bookings.csv`: Dataset used for analysis.

## Contact
- **Author:** Mohamed Said Mahmoud
- **Email:** mohammed.saiid208@gmail.com
- **LinkedIn:** [Mohamed Said](https://www.linkedin.com/in/mohamed-said-1193862a7)
- **Date:** September 16, 2024
