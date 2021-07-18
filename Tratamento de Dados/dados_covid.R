library(dplyr)
library(tidyr)

dados_covid<-read.csv2("dados_covid_sp.csv",sep = ";",encoding = "UTF-8")

dados_covid<-rename(dados_covid, municipio=nome_munic,data=datahora)

dados_covid<-select(dados_covid, -c(2,15:18,22:25))
dados_covid2<-dados_covid %>% filter(municipio!="Ignorado")
dados_covid2<-na.omit(dados_covid2)

glimpse(dados_covid2)
dados_covid2$semana_epidem<-as.integer(dados_covid2$semana_epidem)
dados_covid2$data<-as.Date(dados_covid2$data,format = "%Y-%m-%d")

dados_covid2["porcentagem_idoso"]<-100*dados_covid2$pop_60/dados_covid2$pop

write.table(dados_covid2,file = "dados_covid.csv",sep = ",")
