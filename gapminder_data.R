# Explorando os dados de gapminder.org (dados mundiais)
# https://www.gapminder.org/data/

# Instalando os pacotes
install.packages("plyr")
install.packages("gapminder")


# Examples: 
str(gapminder)
View(gapminder)

head(gapminder)

summary(gapminder)

table(gapminder$continent)

# Expectativa (média) de vida por continente
aggregate(lifeExp ~ continent, gapminder, median)

# Expectativa (maior) de vida por continente
# (Split-Apply-Combine)
df <- ddply(gapminder, ~ continent, 
            summarize, 
            max_le = max(lifeExp))
View(df)

# Expectativa de vida  (menor, maior e média)  por continente
ddply(gapminder, ~ continent, 
      summarize,
      min = min(lifeExp), 
      max = max(lifeExp),
      median = median(gdpPercap))


# gráfico | Expectativa de vida ao lonogo dos anos no 'Cambodia'
plot(lifeExp ~ year, gapminder, subset = country == "Cambodia", type = "b")
