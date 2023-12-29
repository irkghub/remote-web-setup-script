
#Global Variable declaration

ART="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
ART_NAME="2137_barista_cafe"
TEMPDIR="/tmp/webassets"


yum --help 2>&1 >> /dev/null

if [ $? -eq 0 ];then
  echo "Working on a CentOS Machine"

  #Local variable declaration for CentOS
  PKGS="wget unzip httpd"
  SVC="httpd"
  # Install dependencies first of all

  echo "###########################################"
  echo "Installing Dependencies at first"
  echo "###########################################"
  sudo yum install $PKGS -y > /dev/null
  echo

  #Starting and enabling the Apache HTTP Server
  echo "###########################################"
  echo "Starting and enabling Apache HTTP Server"
  echo "###########################################"
  sudo systemctl start $SVC
  sudo systemctl enable $SVC
  echo

  # Define a location to get the artifact
  echo "##########################################"
  echo "Creating a directory to store the artifact"
  echo "#########################################"
  mkdir -p $TEMPDIR
  cd $TEMPDIR
  echo

  #Downloading the artifact
  echo "############################################################"
  echo "Downloading artifact"
  echo "############################################################"
  wget $ART > /dev/null
  unzip $ART_NAME.zip > /dev/null
  echo
  #Placing the artifact to the Apache HTTP Server hosting directory
  echo "############################################################"
  echo "Placing the artifact to Apacher Default Host Directory"
  echo "#####################################################"
  cp -r $TEMPDIR/$ART_NAME/* /var/www/html/

  sudo systemctl reload $SVC

  #Perform clean up at last
  rm -rf $TEMPDIR

  #Show the status of the Apache HTTP Server
  sudo systemctl status $SVC

  #Display the contents of /var/www/html/
  ls /var/www/html/

 else
  echo
  echo "Working with the Ubuntu Machine now"
  echo
  # Local variable declaration for Ubunutu
  PKGS="wget unzip apache2"
  SVC="apache2"
  # Install dependencies first of all
  echo "###########################################"
  echo "Installing Dependencies at first"
  echo "###########################################"
  sudo apt install $PKGS -y > /dev/null
  echo

  #Starting and enabling the Apache HTTP Server
  echo "###########################################"
  echo "Starting and enabling Apache HTTP Server"
  echo "###########################################"
  sudo systemctl start $SVC
   echo

  # Define a location to get the artifac
  echo "##########################################"
  echo "Creating a directory to store the artifact"
  echo "#########################################"
  mkdir -p $TEMPDIR
  cd $TEMPDIR
  echo

  #Downloading the artifact
  echo "############################################################"
  echo "Downloading artifact"
  echo "############################################################"
  wget $ART > /dev/null
  unzip $ART_NAME.zip > /dev/null
  echo
  #Placing the artifact to the Apache HTTP Server hosting directory
  echo "############################################################"
  echo "Placing the artifact to Apacher Default Host Directory"
  echo "#####################################################"
  cp -r $TEMPDIR/$ART_NAME/* /var/www/html/

  sudo systemctl reload $SVC

  #Perform clean up at last
  rm -rf $TEMPDIR

  #Show the status of the Apache HTTP Server
  sudo systemctl status $SVC

  #Display the contents of /var/www/html/
  ls /var/www/html/

fi
