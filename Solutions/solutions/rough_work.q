/00. Overview
/01. Q Shock and Awe - done
/       to remember: , is join
/       # take - from front or back (-/+)
/       select c1, val:2*c3 from t
/       10?20 10 numbers from 0 to 19
/02. Basic Data Types: Atoms
/       
/03.
/       Merging - ^ eg. L1:0N 20 0N L2:10 0N 30 L1^L2 = 10 20 30
/       where - indexes of truth
/       group - dictionary indexes of discrete items
/       
/04.
/05.
/06.
/07.
/08.
/09.
/10.sdkks



\

p:`apple`banana!100 50 /create dictionary
p[`apple]:120 /updates apple price
if[p[`apple]>110;-1"EXPENSIVE"] /print warning if over 110

cal:`nuts`crisps!200 150
cal[`nuts]:250
if[cal[`nuts]>200;-1"High Cal"]

addTen:{[x]x+10}
addTen 5

mach:{[x]temp:x*2;temp+5}
mach 6

@[function;input;error_handler]

checkStock:{[n] $[n<5;"Order more";"Stock ok"]}
checkStock[2]
checkStock[10]

p:10.5 12.1 9.8 15.2 11.0
floor 1.05*p

/update
t:flip `sym`price!(`apple`google`msft;150 2800 300)
update price:price*2 from t where sym=`apple


t:([]name:`alice`bob`charlie;score:88 72 95)
update score:score +5 from t where score<90
update score:?[score<90;score+5;score] from t
update score:score+5*score<90 from t

invent:([]item:`shirt`pants`hat;qty:10 2 15;price:20 40 10)
update total:qty*price,action:?[qty>5;`ok;`restock] from invent


trades:([]sym:`A`B`A`C`B;price:10 20 11 15 21;qty:100 500 200 100 400)
summary:([])
select peak:max price,total:count i by sym from trades

prices:([sym:`AAPL`MSFT] price:150 400)
names:([sym:`AAPL`MSFT] name:`Apple`Microsoft)
volumes:([sym:`AAPL`MSFT] qty:1000 2000)

prices^names^volumes

t:([]sym:`AAPL`MSFT`GOOG`TSLA`AMZN;price:150 400 2800 700 3300)
select from t where sym in `AAPL`TSLA

costume:([]item:`suit`boots;wholesale:80 30;retail:120 45)
update profit:retail-wholesale from costume



jobs:1!flip`func`status!"s*"$\:()
newJob:(`cleanTables;`pending)


p:150
q:200
t:([]sym:`AAPL`MSFT`GOOG;price:150 200 500;quote:150 300 500;queue:700 800 800)
t[price;quote:p;q]
