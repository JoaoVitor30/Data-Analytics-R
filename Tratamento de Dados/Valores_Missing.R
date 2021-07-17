library(tidyr)

# NA (valores ausentes)
sapply(covid_alterado, function(x) sum(is.na(x)))
# NAN not a number (valores indefinidos)
sapply(covid_alterado, function(x) sum(is.nan(x)))

# Onde for NA mudar todos os valores por um número
covid_alterado2<-covid_alterado %>% mutate_all(replace_na,2021)

# Excluindo os missings
covid_alterado2<-covid_alterado2 %>% filter(semana_epidem!=2021)

# substituir os valores missing
covid_alterado2$semana_epidem[covid_alterado2$data >= '2021-01-01' & 
                                covid_alterado2$data <= '2021-01-07'] <- 54