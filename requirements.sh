# If bash command fails, build should error out
set -e

##### Install specific package versions with pip #####
pip3 install pandas
pip3 install folium
pip3 install matplotlib

##### Add files to the datasets/ folder on the live project #####

# A list of files in datasets/ separated by space, needs to be manually updated
FILES="global_temperature.csv run_code_cell_image.png project_image.png"
# The URL where the assets of the project lives
ASSETURL=https://s3.amazonaws.com/assets.datacamp.com/production/project_33/datasets
# Where the datasets will be compied on the Project image.
DATADIR=/home/repl/datasets
  
mkdir -p $DATADIR
for FILE in $FILES
do
	wget -O $DATADIR/$FILE $ASSETURL/$FILE
done
