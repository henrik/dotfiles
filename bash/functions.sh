# henrik@Nyx ~$ cdgem activerecord
# henrik@Nyx /Library/Ruby/Gems/1.8/gems/activerecord-3.0.0.beta$

function cdgem {
  cd /Library/Ruby/Gems/1.8/gems/; cd `ls|grep $1|sort|tail -1`
}
