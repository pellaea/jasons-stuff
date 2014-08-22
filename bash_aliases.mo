alias mo='cd /vagrant/mo'

alias rtest='ruby -Ilib:test'

function mosql {
  mysql -u mo -pmo mo_development
}

function mosqle {
  mysql -u mo -pmo mo_development -e "source $1"
}
