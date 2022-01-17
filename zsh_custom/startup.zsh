# Start Laravel Valet
service nginx status &> /dev/null  || valet start > /dev/null 2>&1

# Start MySQL
service mysql status &> /dev/null || sudo service mysql start > /dev/null 2>&1
# takeout enable mysql