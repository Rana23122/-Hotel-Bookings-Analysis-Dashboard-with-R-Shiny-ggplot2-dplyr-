library(shiny)
library(ggplot2)
library(dplyr)
library(lubridate)
hotel_bookings <- read.csv("D:/hotel_bookings.csv")
View(hotel_bookings)
# Data preprocessing
hotel_bookings$arrival_date <- as.Date(paste(hotel_bookings$arrival_date_year, hotel_bookings$arrival_date_month, hotel_bookings$arrival_date_day_of_month, sep = "-"), "%Y-%B-%d")
hotel_bookings$month <- month(hotel_bookings$arrival_date, label = TRUE)
# Plot the monthly booking trend for both hotel types
hotel_bookings %>%
  filter(hotel %in% c("City Hotel", "Resort Hotel")) %>%
  group_by(hotel, month) %>%
  summarise(bookings = n()) %>%
  ggplot(aes(x = month, y = bookings, fill = bookings)) +  # Added fill aesthetic
  geom_bar(stat = "identity") +
  scale_fill_gradient(low = "skyblue", high = "darkblue") +  # Color gradient
  facet_wrap(~hotel) +
  ggtitle("Monthly Booking Trend by Hotel Type") +
  xlab("Month") + ylab("Number of Bookings") +
  theme_minimal()

# Plot the cancellation rate for both hotel types
hotel_bookings %>%
  filter(hotel %in% c("City Hotel", "Resort Hotel")) %>%
  group_by(hotel, is_canceled) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = as.factor(is_canceled), y = count, fill = as.factor(is_canceled))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"), labels = c("Not Canceled", "Canceled")) +
  facet_wrap(~hotel, labeller = label_wrap_gen(width = 20)) +
  ggtitle("Cancellation Rate by Hotel Type") +
  xlab("Cancellation Status") +
  ylab("Count") +
  theme_minimal()


# Plot the customer type distribution
hotel_bookings %>%
  filter(hotel == hotel_types)%>%
  group_by(customer_type) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = customer_type, y = count, fill = customer_type)) +
  geom_bar(stat = "identity") +
  ggtitle("Customer Type Distribution") +
  xlab("Customer Type") + ylab("Count") +
  theme_minimal()

# Plot the special requests distribution
hotel_bookings %>%
  filter(hotel == hotel_types)%>%
  group_by(total_of_special_requests) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = as.factor(total_of_special_requests), y = count, fill = as.factor(total_of_special_requests))) +
  geom_bar(stat = "identity") +
  ggtitle("Special Requests") +
  xlab("Number of Special Requests") + ylab("Count") +
  scale_fill_brewer(palette = "Set3") +  # Optional: use a color palette
  theme_minimal()

# Plot Customer Type vs Market Segment for both hotel types
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  group_by(hotel, customer_type, market_segment) %>%
  summarise(bookings = n()) %>%
  ggplot(aes(x = customer_type, y = bookings, fill = market_segment)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ hotel) +  # Create separate plots for each hotel type
  ggtitle("Customer Type vs Market Segment") +
  xlab("Customer Type") + ylab("Number of Bookings") + facet_wrap(~ hotel)+
  theme_minimal()

# Plot the top 5 countries by bookings
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  group_by(hotel, country) %>%
  summarise(bookings = n()) %>%
  group_by(hotel) %>%
  top_n(5, bookings) %>%
  ggplot(aes(x = reorder(country, bookings), y = bookings, fill = hotel)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ hotel) +
  ggtitle("Top 5 Countries by Bookings") +
  xlab("Country") + ylab("Number of Bookings") +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal()

# Plot Lead Time vs Cancellation
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  ggplot(aes(x = lead_time, y = is_canceled, color = hotel)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  facet_wrap(~ hotel) +
  ggtitle("Lead Time vs Cancellation") +
  xlab("Lead Time (Days)") + ylab("Cancellation Status") +
  theme_minimal()

# Plot the customer type distribution
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  group_by(hotel, customer_type) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = customer_type, y = count, fill = hotel)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Customer Type Distribution") +
  xlab("Customer Type") + ylab("Count") +
  scale_fill_brewer(palette = "Set3") +facet_wrap(~ hotel)+
  theme_minimal()

# Plot the special requests distribution
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  group_by(hotel, total_of_special_requests) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = as.factor(total_of_special_requests), y = count, fill = hotel)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Special Requests Distribution") +
  xlab("Number of Special Requests") + ylab("Count") +
  scale_fill_brewer(palette = "Set3") +facet_wrap(~ hotel)+
  theme_minimal()

# Plot Lead Time vs Special Requests
hotel_bookings %>%
  filter(hotel %in% hotel_types) %>%
  ggplot(aes(x = lead_time, y = total_of_special_requests)) +
  geom_hex(bins = 30) +
  facet_wrap(~ hotel) +
  ggtitle("Lead Time vs Special Requests") +
  xlab("Lead Time (Days)") + ylab("Number of Special Requests") +
  theme_minimal() +
  scale_fill_viridis_c()  # Optional: use a color palette for the hexbin plot
