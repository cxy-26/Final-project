output/baseline.rds output/newdata.rds: code/data_cleaning.R
	Rscript code/data_cleaning.R

output/table1.rds output/table2.rds output/table3.rds output/first.last.stage.table.rds output/first.last.stage.table.af.rds output/first.last.stage.noaf.rds&: code/tables.R output/baseline.rds
	Rscript code/tables.R

output/plot1.png output/plot2.png&: code/plots.R output/newdata.rds
	Rscript code/plots.R

report.html: report.Rmd output/baseline.rds output/newdata.rds \
  output/table1.rds output/table2.rds output/table3.rds \
  output/first.last.stage.table.rds output/first.last.stage.table.af.rds output/first.last.stage.noaf.rds \
  output/plot1.png output/plot2.png
	Rscript code/render.R

.PHONY:clean
clean:
	rm output/*
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
