
## About

This project features an interactive Shiny dashboard for visualizing and analyzing hotel bookings data. The dashboard leverages R libraries such as `ggplot2`, `dplyr`, and `lubridate` to preprocess and display key metrics related to hotel bookings, cancellations, customer types, and special requests. The analysis focuses on two hotel types: City Hotels and Resort Hotels, providing visual insights that assist stakeholders in decision-making.

The key features include:

- **Monthly Booking Trend:** A visualization of hotel bookings by month for both City and Resort Hotels.
- **Cancellation Rates:** Insights into the cancellation rates for both hotel types.
- **Customer Type Distribution:** A detailed look at customer demographics.
- **Special Requests:** Visualizations of the number of special requests made by customers.
- **Customer Type vs. Market Segment:** A comparison between customer types and market segments.
- **Top 5 Countries by Bookings:** The countries with the highest number of bookings.
- **Lead Time Analysis:** Analysis of lead time and its impact on cancellations and special requests.

---

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/hotel-bookings-analysis.git
   ```

2. Set up R and RStudio, if not already installed.

3. Install the necessary R packages:
   ```R
   install.packages(c("shiny", "ggplot2", "dplyr", "lubridate", "viridis"))
   ```

4. Download the `hotel_bookings.csv` dataset and place it in the project directory.

5. Run the Shiny app:
   ```R
   library(shiny)
   runApp()
   ```

---

## Key Visualizations

1. **Monthly Booking Trend:** A bar chart that shows the number of bookings by month for both City and Resort Hotels, with color gradients representing the volume of bookings.
  
2. **Cancellation Rates:** A bar plot displaying the count of canceled vs. non-canceled bookings across both hotel types.

3. **Customer Type Distribution:** Visualizes the distribution of customer types (e.g., transient, group) for both hotels.

4. **Special Requests:** A bar chart showing the number of special requests made by customers, segmented by hotel type.

5. **Customer Type vs. Market Segment:** A comparison of customer types with market segments (e.g., corporate, direct) for both hotels.

6. **Top 5 Countries by Bookings:** A bar plot showcasing the top 5 countries with the highest number of hotel bookings.

7. **Lead Time vs Cancellation:** A scatter plot visualizing the relationship between lead time and cancellations, with a linear regression trend line.

8. **Lead Time vs Special Requests:** A hexbin plot exploring the correlation between lead time and the number of special requests.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Contact

For questions or collaboration, please reach out to [Rana Esmail Helmy](mailto:ranaesmail678m@gmail.com).
