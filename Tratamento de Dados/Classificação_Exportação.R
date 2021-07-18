# Semelhante ao str
glimpse(covid_alterado2)

# Transformando a tipagem dos atributos
covid_alterado2$semana_epidem<-as.integer(covid_alterado2$semana_epidem)
covid_alterado2$data<-as.Date(covid_alterado2$data, format = "%Y-%m-%d")

# Criando uma coluna
covid_alterado2["idoso"]<-100*covid_alterado2$pop_60/covid_alterado2$pop

# Exportação dos arquivos
write.table(covid_alterado2,file = "covid_sp_tratado.csv", sep = ",")