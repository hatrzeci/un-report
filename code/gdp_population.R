library(tidyverse)

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?", size = "Population (in millions)") +
  geom_point() +
  scale_color_brewer(palette = "Set1")

# larger gapminder dataset
gapminder_data <- read_csv(file = "data/gapminder_data.csv")

ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent, group = country) +
  geom_line()


ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_boxplot()

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() + 
  geom_jitter(width = 0.3, height = 0,
              aes(size = pop))


ggplot(data = gapminder_1997) +
  aes(x = log(gdpPercap), y = lifeExp) +
  geom_point()

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(color = "green", fill = "blue") +
  geom_jitter(color = "purple")

violin_plot <- ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  geom_jitter(width = 0.3)

violin_plot <- violin_plot + theme_bw()
ggsave("figures/awesome_violin_plot.jpg", plot = violin_plot, width = 6, height = 4)


#Themes
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20, color = "black") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5))



#Facets
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_wrap(vars(continent))

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(rows = vars(continent))

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_grid(vars(continent))


ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, fill = continent) +
  geom_point(shape = 21, color = "black") +
  facet_grid(rows = vars(continent)) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?") +
  theme_bw() +
  theme(axis.title = element_text(face = "bold")) +
  theme(title = element_text(face = "bold")) +
  theme(legend.position = "none")
ggsave("figures/awesome_plot.jpg")
