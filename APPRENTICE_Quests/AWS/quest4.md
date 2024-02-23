# ポート番号について説明できる

## 1. ポート番号とは

ポート番号とは何か、何のためにあるものか、プログラミング初心者にわかるように説明してください。


通信の受付窓口
どういう種類の通信なのか判別するため
ssh通信なら22番にアクセスしてもらう

**ポート番号はプログラムのアドレス**

実際は「IPアドレス＋ポート番号」で通信を行っています
サーバー側のポート番号は意味がある

## 2. 代表的なポート番号

代表的なポート番号はウェルノウンポートと呼ばれています。ウェルノウンポートをいくつか挙げてください。また、それぞれのポート番号が何のために使われているか説明してください。

SSHサーバー
port 22
HTTPサーバー
port 80
SMTPサーバー
port 25
HTTPS
port 443

## 3. HTTP/HTTPS 通信

ブラウザでウェブページを開く際に、ポート番号を指定することができます。

`https://www.google.com/` をブラウザで開く際に `https://www.google.com:443` を指定しても同じページが開かれますが、`https://www.google.com:22` とするとページが開かれません。

その理由を説明してください。また、ブラザでウェブページを開く際に通常はポート番号を指定しませんが、その理由も説明してください。

443はhttps通信だが
22はssh通信

ウェブブラウザがプロトコルに基づいて適切なデフォルトのポート番号を使用するため指定しない
HTTPは80,HTTPSは443

## 4. データベースへの接続

データベースに接続する際に、ポート番号を指定しています。ポート番号何番を指定しているか確認してください。


MySQL
TCP port:               3306


## 5. ポート番号の確認

今自分が使用しているパソコンで使用しているポート番号とそのポート番号を動かしているプログラムを調べてください。

windows
netstatコマンド


アクティブな接続

  プロトコル  ローカル アドレス      外部アドレス           状態       
  TCP         127.0.0.1:49673        kubernetes:49674       ESTABLISHED
  TCP         127.0.0.1:49674        kubernetes:49673       ESTABLISHED
  TCP         127.0.0.1:49675        kubernetes:49676       ESTABLISHED
  TCP         127.0.0.1:49676        kubernetes:49675       ESTABLISHED
  TCP         127.0.0.1:49677        kubernetes:49858       ESTABLISHED
  TCP         127.0.0.1:49746        kubernetes:49747       ESTABLISHED
  TCP         127.0.0.1:49747        kubernetes:49746       ESTABLISHED
  TCP         127.0.0.1:49751        kubernetes:49752       ESTABLISHED
  TCP         127.0.0.1:49752        kubernetes:49751       ESTABLISHED
  TCP         127.0.0.1:49770        kubernetes:65001       ESTABLISHED
  TCP         127.0.0.1:49773        kubernetes:49789       ESTABLISHED
  TCP         127.0.0.1:49789        kubernetes:49773       ESTABLISHED
  TCP         127.0.0.1:49858        kubernetes:49677       ESTABLISHED
  TCP         127.0.0.1:50371        kubernetes:50374       ESTABLISHED
  TCP         127.0.0.1:50374        kubernetes:50371       ESTABLISHED
  TCP         127.0.0.1:65001        kubernetes:49770       ESTABLISHED
  TCP         192.168.1.102:49685    20.198.118.190:https   ESTABLISHED
  TCP         192.168.1.102:49811    72.25.64.2:https       ESTABLISHED
  TCP         192.168.1.102:49813    server-13-33-5-83:https  CLOSE_WAIT
  TCP         192.168.1.102:49845    ec2-3-232-144-130:https  ESTABLISHED
  TCP         192.168.1.102:50158    static:https           ESTABLISHED
  TCP         192.168.1.102:50251    ec2-52-11-71-214:https  ESTABLISHED
  TCP         192.168.1.102:50252    ec2-54-188-94-139:https  ESTABLISHED
  TCP         192.168.1.102:50264    151.101.90.167:https   ESTABLISHED
  TCP         192.168.1.102:50294    video-edge-a07b42:https  ESTABLISHED
  TCP         192.168.1.102:50339    45.113.131.24:https    ESTABLISHED
  TCP         192.168.1.102:50543    38:https               ESTABLISHED
  TCP         192.168.1.102:50614    ec2-34-213-45-182:https  ESTABLISHED
  TCP         192.168.1.102:50621    ec2-52-37-155-77:https  ESTABLISHED
  TCP         192.168.1.102:50623    ec2-100-20-22-8:https  ESTABLISHED
  TCP         192.168.1.102:50628    video-edge-a074fa:https  ESTABLISHED
  TCP         192.168.1.102:50853    lb-140-82-113-26-iad:https  ESTABLISHED
  TCP         192.168.1.102:51013    www26:https            ESTABLISHED
  TCP         192.168.1.102:51021    13.68.233.9:https      ESTABLISHED
  TCP         192.168.1.102:51024    20.189.173.2:https     ESTABLISHED
  TCP         192.168.1.102:51025    ec2-18-182-178-246:https  ESTABLISHED
  TCP         192.168.1.102:51027    ec2-54-178-179-194:https  ESTABLISHED
  TCP         192.168.1.102:51028    ec2-54-178-179-194:https  ESTABLISHED
  TCP         192.168.1.102:51030    ec2-18-182-178-246:https  ESTABLISHED
  TCP         192.168.1.102:51036    server-18-65-116-15:https  ESTABLISHED
  TCP         192.168.1.102:51037    103.70.240.197:http    ESTABLISHED
  TCP         192.168.1.102:51038    119.63.193.220:https   ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49795  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49798  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49801  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49804  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49816  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49821  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49826  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49878  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49882  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49887  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49891  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49892  ESTABLISHED
  TCP         [::1]:5426             DESKTOP-NJHB1G1:49899  ESTABLISHED
  TCP         [::1]:49795            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49798            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49801            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49804            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49816            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49821            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49826            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49878            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49882            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49887            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49891            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49892            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:49899            DESKTOP-NJHB1G1:5426   ESTABLISHED
  TCP         [::1]:51022            DESKTOP-NJHB1G1:3306   TIME_WAIT
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:49703  g2600-140b-1e00-000d-0000-0000-17d5-290e:
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:49705  g2600-140b-1e00-000d-0000-0000-17d5-2922:
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:49709  g2600-140b-1e00-000d-0000-0000-17d5-290e:
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:49748  edge-mqtt6-shv-01-itm1:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:49753  edge-mqtt6-shv-01-itm1:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50062  edge-oculus6-shv-01-itm1:https  CLOSE_WAI
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50154  tm-in-xbc:5228         ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50384  [2a04:4e42::483]:https  CLOSE_WAIT
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50606  [2600:9000:26a9:f200:19:f28c:cd92:c761]:h
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50967  [2600:1901:0:47fc::]:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50969  nrt20s08-in-x03:https  TIME_WAIT
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50971  [2600:9000:26a9:8200:7:49a5:5fd3:b641]:ht
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50979  [2a04:4e42:15::485]:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50981  [2a04:4e42:400::649]:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50982  [2606:4700:e6::ac40:ce26]:https  ESTABLIS
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:50983  [2606:4700:e6::ac40:ce26]:https  ESTABLIS
 ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51016  nrt12s47-in-x0a:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51017  kix07s07-in-x03:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51019  kix06s05-in-x0a:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51020  kix07s07-in-x0e:https  TIME_WAIT
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51023  nrt20s08-in-x03:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51026  nrt12s28-in-x0a:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51035  xx-fbcdn6-shv-01-itm1:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51039  kix07s06-in-x0a:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51040  [2406:da14:a0b:8100:3872:b388:7e1b:fa9d]:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51041  edge-star-mini6-shv-01-itm1:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51042  [2001:ce8:0:18:face:b00c:0:a7]:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51043  xx-fbcdn6-shv-01-itm1:https  ESTABLISHED
  TCP         [2001:ce8:142:26c9:10ee:d516:f3bc:aa4c]:51051  [2600:9000:21b5:f400:c:132:48e:f021]:https  ESTABLISHED
