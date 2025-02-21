library(dplyr)

# Abrindo o arquivo
covid<-read.csv2("dados_covid_sp.csv", sep = ";", encoding = "UTF-8")

# Renomeando vari�veis
covid_alterado<-rename(covid, municipio=nome_munic,data=datahora,
                       rotulo_mapa=map_leg,codigo_mapa=map_leg_s)

# Excluindo uma coluna (por nome)
covid_alterado$cod_ra<-NULL

# Excluindo uma coluna (por n�mero)
covid_alterado<-select(covid_alterado,-c(21))

# Excluindo v�rias colunas (por nome)
covid_alterado<-subset(covid_alterado, select = -c(codigo_ibge,cod_drs))

# Excluindo v�rias colunas (por n�meros)
covid_alterado<-select(covid_alterado, -c(14,15))
covid_alterado<-select(covid_alterado, -c(17:19))

# Excluindo uma linha ou v�rias(por n�mero)
covid_alterado<-slice(covid_alterado, -c(239660))
covid_alterado<-slice(covid_alterado, -c(239660:239666))

# Excluindo v�rias linhas (por nome)
covid_alterado<-covid_alterado %>% filter(municipio!="Ignorado")