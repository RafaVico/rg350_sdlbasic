#Struct Code

'ウィンドウ表示
	clear
	dim paraa(3),parab(3),shota(2),shotb(2),tekia(7),tekib(7),tmx(3),tmy(3),tmf(3)
	dim tekidat$(14),tekix(2),tekixb(2),tekiy(2),tekiyb(2),tekino(2),tekif(2),kakudo(2)
	dim tshotx(5),tshoty(5),tshotxb(5),tshotyb(5),tshotf(5),box(4),boy(4),fao(50,9)
	Randomize

	Window hMainWnd,0,-1,-1,500,440,"☆パラソルウィッチ☆",WS_SYSMENU
	Window hdrawWnd,hMainWnd,-1,-1,-1,-1,"",WS_CAPTION
	Window hchrWnd,hMainWnd,-1,-1,-1,-1,"",WS_CAPTION
	Window hbackWnd,hMainWnd,-1,-1,-1,-1,"",WS_CAPTION
	ShowWnd hMainWnd, SW_SHOW

	Thread *main

'メッセージループ
*MessageRoop
 	GetWndMsg hThisWnd,Message,wParam,lParam
	If hThisWnd=hMainWnd and Message=WM_CLOSE Then endflag=-1:sleep 400:MCISound "close shot":MCISound "close bomb":MCISound "close boss":MCISound "close kyuu":MCISound "close kaihuku":MCISound "close midi":DelWnd hMainWnd:end
	
	Goto *MessageRoop

'ここからメインだよん
*main
	S$="open "+chr$(34)+"shot.wav"+chr$(34)+" type waveaudio alias shot"
	MCISound S$
	S$="open "+chr$(34)+"bomb.wav"+chr$(34)+" type waveaudio alias bomb"
	MCISound S$
	S$="open "+chr$(34)+"boss.wav"+chr$(34)+" type waveaudio alias boss"
	MCISound S$
	S$="open "+chr$(34)+"kyuu.wav"+chr$(34)+" type waveaudio alias kyuu"
	MCISound S$
	S$="open "+chr$(34)+"kaihuku.wav"+chr$(34)+" type waveaudio alias kaihuku"
	MCISound S$
	S$="open "+chr$(34)+"title.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$

	for i=0 to 14:read tekidat$(i):next

*mn2
	eki=0:mut=0:push=0
	TargetWnd hMainWnd
	bload"paratitle.bmp",paratitle
	put@(0,0),paratitle,pset
	gosub *mtitle
	gosub *bkeshi
*sutato
	if endflag then sleep 200:end 2
	If Inkey$="p" and push=0 Then mut=mut+1:if mut=100 then beep:eki=1
	If KeyState(Asc("p")) and &H8000 and push=1 Then Else push=0
	if inkey$<>" " then *sutato

	MCIsound "stop midi"
	gosub *story
	MCIsound "stop midi"

'キャラを各変数にセット
	Wit=20:stageno=0:hp=100:mp=0
	box(0)=350:box(1)=380:box(2)=380:box(3)=350:box(4)=350
	boy(0)=125:boy(1)=230:boy(2)=230:boy(3)=125:boy(4)=124

*stageloop
	push=0:daf=1:dac=30:bakuha=100:x=50:y=50:for i=0 to 3:tmx(i)=530:tmy(0)=400:next i:count=0:taikyuu=80+stageno*40
	for i=0 to 2
	tekix(i)=580:tekiy(i)=400:tekif(i)=0
	next i
	for i=0 to 5
	tshotx(i)=580:tshoty(i)=400
	next i

	gosub *fadein
	TargetWnd hdrawWnd
	if stageno=0 then bload"st1.bmp",hanasi
	if stageno=1 then bload"st2.bmp",hanasi
	if stageno=2 then bload"st3.bmp",hanasi
	if stageno=3 then bload"st4.bmp",hanasi
	if stageno=4 then bload"st5.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	gosub *fadeout
	sleep 2500
	gosub *fadein

	TextOut 10,315," HP:"+str$(hp)+"% ",7,0,15,10,"ＭＳ ゴシック"
	'TextOut 310,315,"SCORE:",7,0,15,10,"ＭＳ ゴシック"
	TextOut 10,345," MP:"+str$(mp)+"% ",7,0,15,10,"ＭＳ ゴシック"

'グラフィックを各ウィンドウに配置
	if stageno=0 then BLoad "st1kyara.bmp",para:BLoad "stage1.bmp",back:gosub *mst1
	if stageno=1 then BLoad "st2kyara.bmp",para:BLoad "stage2.bmp",back:gosub *mst2
	if stageno=2 then BLoad "st3kyara.bmp",para:BLoad "stage3.bmp",back:gosub *mst3
	if stageno=3 then BLoad "st4kyara.bmp",para:BLoad "stage4.bmp",back:gosub *mst4
	if stageno=4 then BLoad "st5kyara.bmp",para:BLoad "stage5.bmp",back:gosub *mst5
	stageno=stageno+1
	TargetWnd hbackWnd
	put@(0,0),back,pset
	TargetWnd hchrWnd
	put@(0,0),para,pset

	get@(0,0)-(49,49),paraa(0)
	get@(0,50)-(49,99),parab(0)
	get@(50,0)-(99,49),paraa(1)
	get@(50,50)-(99,99),parab(1)
	get@(100,0)-(149,49),paraa(2)
	get@(100,50)-(149,99),parab(2)
	get@(150,0)-(199,49),paraa(3)
	get@(150,50)-(199,99),parab(3)
	get@(0,100)-(49,149),tekia(0)
	get@(0,150)-(49,199),tekib(0)
	get@(50,100)-(99,149),tekia(1)
	get@(50,150)-(99,199),tekib(1)
	get@(100,100)-(149,149),tekia(2)
	get@(100,150)-(149,199),tekib(2)
	get@(150,100)-(199,149),tekia(3)
	get@(150,150)-(199,199),tekib(3)
	get@(0,200)-(14,214),shota(0)
	get@(0,215)-(14,229),shotb(0)
	get@(15,200)-(44,214),shota(1)
	get@(15,215)-(44,229),shotb(1)
	get@(45,200)-(74,214),shota(2)
	get@(45,215)-(74,229),shotb(2)
	get@(75,200)-(83,208),tshota
	get@(75,209)-(83,217),tshotb
	get@(84,200)-(133,202),laser0a
	get@(84,203)-(133,205),laser0b
	get@(200,0)-(349,149),boss0a
	get@(200,150)-(349,299),boss0b
	get@(0,250)-(49,299),tekia(4)
	get@(50,250)-(99,299),tekia(5)
	get@(100,250)-(149,299),tekia(6)
	get@(150,250)-(199,299),tekia(7)
	get@(0,300)-(49,349),tekib(4)
	get@(50,300)-(99,349),tekib(5)
	get@(100,300)-(149,349),tekib(6)
	get@(150,300)-(199,349),tekib(7)

	gosub *bkeshi

'さあ内容だ！
*mainloop
	for scrx=0 to 119 step 2
	if endflag then sleep 200:end 2
	if stageno=5 and count=1350 then gosub *mlastboss:goto *ata10
	if count=1350 then gosub *mmboss
*ata10
	if count<=1300 or count>=1350 then gosub *repeat else MCIsound "stop midi"
	TargetWnd hbackWnd
	get@(scrx,0)-(scrx+479,299),scback
	TargetWnd hdrawWnd
	put@(50,50),scback,pset
	FRAME=FRAME+1
	IF T$<>TIME$ THEN T$=TIME$:GOSUB *ShowFPS
	if Wit<=0 then *jmp2
	SLEEP Wit

*jmp2
	put@(tmx(0),tmy(0)),shotb(powno),and:put@(tmx(0),tmy(0)),shota(powno),or
	put@(tmx(1),tmy(1)),shotb(powno),and:put@(tmx(1),tmy(1)),shota(powno),or
	put@(tmx(2),tmy(2)),shotb(powno),and:put@(tmx(2),tmy(2)),shota(powno),or
	put@(tmx(3),tmy(3)),shotb(powno),and:put@(tmx(3),tmy(3)),shota(powno),or
	if hp<=0 then put@(x,y),parab(3),and:put@(x,y),paraa(3),or:goto *tobu
	daco=dac/2-int(dac/2):if daco=0.5 then *tobu
	if daf=2 then put@(x,y),tekib(7),and:put@(x,y),tekia(7),or
	put@(x,y),parab(chno),and:put@(x,y),paraa(chno),or
*tobu
	if count>=1440 then *bosstamahyoji
	for i=0 to 2
	if tshotf(i)>=1 then put@(tshotx(i),tshoty(i)),tshotb,and:put@(tshotx(i),tshoty(i)),tshota,or
	next i
	if count>=1400 then *boss
	if tekif(0)>=1 then put@(tekix(0),tekiy(0)),tekib(int(tekino(0))),and:put@(tekix(0),tekiy(0)),tekia(int(tekino(0))),or
	if tekif(1)>=1 then put@(tekix(1),tekiy(1)),tekib(int(tekino(1))),and:put@(tekix(1),tekiy(1)),tekia(int(tekino(1))),or
	if tekif(2)>=1 then put@(tekix(2),tekiy(2)),tekib(int(tekino(2))),and:put@(tekix(2),tekiy(2)),tekia(int(tekino(2))),or
*jmp8
	get@(50,50)-(529,349),gmap
	TargetWnd hMainWnd
	put@(6,10),gmap,pset
	TextOut 0,375,"　　"+str$(FPS)+"FPS  ",6,0,10,5
	TextOut 0,385,"　　"+str$(Wit)+"Wait  ",6,0,10,5
	if hp<=0 then *gameover
	
'操作するよ！
	powno=-(mp>50)-(mp>75)
	If Inkey$="x" and push=0 and mp=100 Then mp=0:hp=100:gosub *kaihu:daf=2:dac=30
	If KeyState(Asc("x")) and &H8000 and push=1 Then Else push=0
	if keystate(28)and&h8000 then x=x-6*(x<450)
	if keystate(29)and&h8000 then x=x+6*(x>50)
	y=y+6
	chno=0
	if keystate(30)and&h8000 then y=y-6+6*(y>65):chno=1
	if keystate(16)and&h8000 then y=y+2:chno=2 else if keystate(90)and&h8000 then gosub *mybeam1
	tmx(0)=tmx(0)+15*((1-(powno>=1))*tmf(0)):tmf(0)=-tmf(0)*(tmx(0)<530):tmx(0)=-tmx(0)*(tmx(0)<530):tmy(0)=-tmy(0)*(tmx(0)<530)-400*(tmx(0)>=530)
	tmx(1)=tmx(1)+15*((1-(powno>=1))*tmf(1)):tmf(1)=-tmf(1)*(tmx(1)<530):tmx(1)=-tmx(1)*(tmx(1)<530):tmy(1)=-tmy(1)*(tmx(1)<530)-400*(tmx(1)>=530)
	tmx(2)=tmx(2)+15*((1-(powno>=1))*tmf(2)):tmf(2)=-tmf(2)*(tmx(2)<530):tmx(2)=-tmx(2)*(tmx(2)<530):tmy(2)=-tmy(2)*(tmx(2)<530)-400*(tmx(2)>=530)
	tmx(3)=tmx(3)+15*((1-(powno>=1))*tmf(3)):tmf(3)=-tmf(3)*(tmx(3)<530):tmx(3)=-tmx(3)*(tmx(3)<530):tmy(3)=-tmy(3)*(tmx(3)<530)-400*(tmx(3)>=530)

	if y>=295 then y=295

'てきが出るよ！

	if count>=1440 then on stageno goto *bomo1,*bomo2,*bomo3,*bomo4,*bomo5

	if tekif(0)>=1 then *jmp5 else tdat=-1*val(mid$(tekidat$((stageno-1)*3),int(count/25)+1,1))*(((count-25)/75-int((count-25)/75))=0):tekino(0)=-1*((count>=325)+(count>=625)+(count>=925))
	i=0:on tdat gosub *waveshoki,*nashoki,*chokushoki,*sitashoki,*teshoki,*hashoki,*toshoki
*jmp5
	if tekif(1)>=1 then *jmp6 else tdat=-1*val(mid$(tekidat$((stageno-1)*3+1),int(count/25)+1,1))*(((count-50)/75-int((count-50)/75))=0):tekino(1)=-1*((count>=350)+(count>=650)+(count>=950))
	i=1:on tdat gosub *waveshoki,*nashoki,*chokushoki,*sitashoki,*teshoki,*hashoki,*toshoki
*jmp6
	if tekif(2)>=1 then *jmp7 else tdat=-1*val(mid$(tekidat$((stageno-1)*3+2),int(count/25)+1,1))*(((count-75)/75-int((count-75)/75))=0):tekino(2)=-1*((count>=375)+(count>=675)+(count>=975))
	i=2:on tdat gosub *waveshoki,*nashoki,*chokushoki,*sitashoki,*teshoki,*hashoki,*toshoki
*jmp7

'当り判定なのだ！
	for j=0 to 2
	if tekif(j)=0 or tekif(j)=9 then *ata2
	for i=0 to 3 
	if tmf(i)=1 then hantei1=(abs(tekix(j)+17-tmx(i))<=33)+(abs(tekiy(j)+17-tmy(i))<=33):if hantei1=-2 then *bakuhashoki
*ata1
	next i
*ata2
	next j
*ata3

'食らい判定な～のだ！
	for i=0 to 2
	if tshotf(i)=0 then *ata4
	if chno=2 then hantei2=(abs(x+39-tshotx(i))<=11)+(abs(y+29-tshoty(i))<=19) else hantei2=(abs(x+9-tshotx(i))<=19)+(abs(y+1-tshoty(i))<=11)
	if hantei2=-2 then mp=mp+2:gosub *tkyu:tshotf(i)=0:tshotx(i)=580:tshoty(i)=400:if mp>=100 then mp=100

*ata4
	next i

	if daf<>0 then *dame
	if eki=1 then *daend

	for i=0 to 2
	if tekif(i)=0 or tekif(i)=9 then *ata5
	hantei2=(abs(x-2-tekix(i))<=35)+(abs(y+6-tekiy(i))<=40)
	if hantei2=-2 then hp=hp-10:gosub *daku:gosub *dasho:if hp<=0 then hp=0
*ata5
	next i
	for i=0 to 2
	if tshotf(i)=0 then *ata6
	hantei2=(abs(x+18-tshotx(i))<=15)+(abs(y+26-tshoty(i))<=20)
	if hantei2=-2 then hp=hp-5:gosub *daku:gosub *dasho:tshotf(i)=0:tshotx(i)=580:tshoty(i)=400:if hp<=0 then hp=0
*ata6
	next i

*daend
	if tekif(0)>=1 or tekif(1)>=1 or tekif(2)>=1 then gosub *tekimove

	
'てきが弾だすぞ！
	for q=0 to 2
	if tshotf(q)=0 then *jmp3
	tshotx(q)=tshotx(q)+tshotxb(q)
	tshoty(q)=tshoty(q)+tshotyb(q)
	if tshotx(q)<=0 or tshoty(q)<=0 or tshotx(q)>=530 or tshoty(q)>=350 then tshotf(q)=0:tshotx(q)=580:tshoty(q)=400
*jmp3
	next q

*jmp4
	line(45,332)-(45+hp*2,342),6,bf
	line(246,332)-(46+hp*2,342),0,bf
	line(45,362)-(45+mp*2,372),4-(mp>50)-(mp>75)-(mp>=100),bf
	line(246,362)-(46+mp*2,372),0,bf
	count=count+1
	if count>=1441 then count=1441
	TextOut 10,315," HP:"+str$(hp)+"% ",7,0,15,10,"ＭＳ ゴシック"
	TextOut 10,345," MP:"+str$(mp)+"%   ",7,0,15,10,"ＭＳ ゴシック"

	next scrx
	goto *mainloop

*mybeam1
	if tmf(0)=1 and tmf(1)=1 and tmf(2)=1 and tmf(3)=1 then return
	if tmf(3)=0 and tmf(2)=1 then tmx(3)=x+20:tmy(3)=y+20:tmf(3)=1
	if tmf(2)=0 and tmf(1)=1 then tmx(2)=x+20:tmy(2)=y+20:tmf(2)=1
	if tmf(1)=0 and tmf(0)=1 then tmx(1)=x+20:tmy(1)=y+20:tmf(1)=1
	if tmf(0)=0 then tmx(0)=x+20:tmy(0)=y+20:tmf(0)=1
	return

*tekimove
	for i=0 to 2
	if tekif(i)=9 then gosub *bakuha:goto *tekimove2
	tama=int(rnd(1)*20)
	if tshotf(i)=0 and tekif(i)>=1 and tama=10 then gosub *tamakeisan
	on tekif(i) gosub *waveidou,*naidou,*chokusinidou,*sitaidou,*teidou,*haidou,*toidou
*tekimove2
	next
	return

*waveshoki
	tekif(i)=1:kakudo(i)=rnd(1)*6:tekix(i)=530:tekiyb(i)=int(rnd(1)*250)+50:return
*waveidou	
	tekix(i)=tekix(i)-8:tekiy(i)=tekiyb(i)+sin(kakudo(i))*50
	if tekiy(i)<=0 then tekiy(i)=0
	if tekiy(i)>=350 then tekiy(i)=350
	if tekix(i)<=0 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	kakudo(i)=kakudo(i)+0.25:if kakudo(i)>6.25 then kakudo(i)=0
	return

*nashoki
	tekif(i)=2:tekix(i)=int(rnd(1)*300)+115:tekiy(i)=0:tekixb(i)=8-rnd(1)*16:return
*naidou
	tekix(i)=tekix(i)+tekixb(i):tekiy(i)=tekiy(i)+5
	if tekix(i)<=0 or tekix(i)>=530 or tekiy(i)>=350 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	return

*chokushoki
	tekif(i)=3:tekix(i)=530:tekiy(i)=int(rnd(1)*250)+50:return
*chokusinidou
	tekix(i)=tekix(i)-12
	if tekix(i)<=0 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	return

*sitashoki
	tekif(i)=4:tekix(i)=int(rnd(1)*300)+115:tekiy(i)=0:return
*sitaidou
	tekiy(i)=tekiy(i)+5
	if tekiy(i)>=350 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	return

*teshoki
	tekif(i)=5:tekix(i)=530:tekiy(i)=300:return
*teidou
	tekix(i)=tekix(i)-8:if tekix(i)<=0 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	return

*hashoki
	tekif(i)=6:tekix(i)=530:tekiyb(i)=300:kakudo(i)=3:return
*haidou
	tekix(i)=tekix(i)-8:tekiy(i)=250+sin(kakudo(i))*200
	if tekix(i)<=0 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	kakudo(i)=kakudo(i)+0.125:if kakudo(i)>6.25 then kakudo(i)=3
	return

*toshoki
	tekif(i)=7
	uo=int(rnd(1)*4)
	if uo<=0 then tekix(i)=rnd(1)*549+1:tekiy(i)=1
	if uo=1 then tekix(i)=rnd(1)*549+1:tekiy(i)=349
	if uo=2 then tekix(i)=1:tekiy(i)=rnd(1)*349+1
	if uo>=3 then tekix(i)=549:tekiy(i)=rnd(1)*349+1
	n=abs(x-tekix(i)):m=abs(y-tekiy(i))
	fff=sqr(n*n+m*m)/12
	tekixb(i)=(x-tekix(i))/fff
	tekiyb(i)=(y-tekiy(i))/fff
	return
*toidou
	tekix(i)=tekix(i)+tekixb(i):tekiy(i)=tekiy(i)+tekiyb(i)
	if tekix(i)<=0 or tekiy(i)<=0 or tekix(i)>=550 or tekiy(i)>=350 then tekif(i)=0:tekix(i)=580:tekiy(i)=400
	return

*bakuhashoki
	tekif(j)=9:tmx(i)=600:tekino(j)=4:gosub *daata:goto *ata1
*bakuha
	tekino(i)=tekino(i)+1:if tekino(i)>=8 then tekif(i)=0
	return

*dasho
	daf=1:dac=30:return
*dame
	dac=dac-1:if dac=0 then daf=0
	goto *daend
*dame2
	dac=dac-1:if dac=0 then daf=0
	goto *jmp4

*tamakeisan
	tshotf(i)=1:tshotx(i)=tekix(i)+25:tshoty(i)=tekiy(i)+25
	n=abs(x-tekix(i)):m=abs(y-tekiy(i))
	fff=sqr(n*n+m*m)/12:if fff=0 then fff=1
	tshotxb(i)=(x-tekix(i))/fff
	tshotyb(i)=(y-tekiy(i))/fff
	return

*boss
	for i=0 to 3
	bhyoji=bhyoji-(count>=(1400+i*4) and count<=(1401+i*4))
	next
	for i=0 to 3
	bhyoji=bhyoji-(count=(1416+i*4))-(count=(1418+i*4))
	next
	bhyoji=bhyoji-(count>=1420)
	if bhyoji=1 then put@(box(stageno-1),boy(stageno-1)),boss0b,and:put@(box(stageno-1),boy(stageno-1)),boss0a,or
	bhyoji=0:kakudo(0)=0:hhh=-1:hx=1:hy=1
	goto *jmp8

*bosstamahyoji
	for i=0 to 3
	if tshotf(i)>=1 then put@(tshotx(i),tshoty(i)),tshotb,and:put@(tshotx(i),tshoty(i)),tshota,or
	next i
	if stageno=1 or stageno=3 or stageno=5 then put@(tshotx(4),tshoty(4)),laser0b,and:put@(tshotx(4),tshoty(4)),laser0a,or:put@(tshotx(5),tshoty(5)),laser0b,and:put@(tshotx(5),tshoty(5)),laser0a,or
	if taikyuu<=-1 then *bshori 
	put@(box(stageno-1),boy(stageno-1)),boss0b,and:put@(box(stageno-1),boy(stageno-1)),boss0a,or
	goto *jmp8

*bomo1	
	if taikyuu<=-1 then *bossbakuha

	boy(stageno-1)=125+sin(kakudo(0))*75
	kakudo(0)=kakudo(0)+0.125:if kakudo(0)>6.1875 then kakudo(0)=0
	if tshotf(4)=0 then tshotf(4)=1:tshotx(4)=box(stageno-1)-20:tshoty(4)=boy(stageno-1)+14:tshotf(5)=1:tshotx(5)=box(stageno-1)-20:tshoty(5)=boy(stageno-1)+133:goto *bjmp
	tshotx(4)=tshotx(4)-10:tshotx(5)=tshotx(5)-10
	if tshotx(4)<=0 then tshotf(4)=0:tshotx(4)=580:tshoty(4)=400:tshotf(5)=0:tshotx(5)=580:tshoty(5)=400
	goto *bjmp

*bomo2	
	if taikyuu<=-1 then *bossbakuha

	box(stageno-1)=box(stageno-1)+hhh*8
	if box(stageno-1)>=380 then hhh=-1
	if box(stageno-1)<=50 then hhh=1
	goto *bjmp

*bomo3	
	if taikyuu<=-1 then *bossbakuha

	boy(stageno-1)=230+sin(3.25+kakudo(0))*200
	box(stageno-1)=box(stageno-1)+hhh*12:kakudo(0)=kakudo(0)+0.125:if kakudo(0)>3 then kakudo(0)=0:hhh=(hhh=1)-(hhh=-1)

	if tshotf(4)=0 then tshotf(4)=1:tshotx(4)=box(stageno-1)+10:tshoty(4)=boy(stageno-1)+80:tshotf(5)=1:tshotx(5)=box(stageno-1)+10:tshoty(5)=boy(stageno-1)+80:goto *bjmp
	tshotx(4)=tshotx(4)-20:tshotx(5)=tshotx(5)-20
	if tshotx(4)<=0 then tshotf(4)=0:tshotx(4)=580:tshoty(4)=400:tshotf(5)=0:tshotx(5)=580:tshoty(5)=400
	goto *bjmp

*bomo4	
	if taikyuu<=-1 then *bossbakuha

	n=abs(x+25-(box(stageno-1)+75)):m=abs(y+25-(boy(stageno-1)+75))
	fff=sqr(n*n+m*m)/2:if fff=0 then fff=1
	box(stageno-1)=box(stageno-1)+(x+25-(box(stageno-1)+75))/fff
	boy(stageno-1)=boy(stageno-1)+(y+25-(boy(stageno-1)+75))/fff
	goto *bjmp

*bomo5	
	if taikyuu<=-1 then *bossbakuha
	boy(stageno-1)=boy(stageno-1)-4*hy
	if boy(stageno-1)=48 or boy(stageno-1)=200 then hy=-hy
	box(stageno-1)=box(stageno-1)+4*hx
	if box(stageno-1)=50 or box(stageno-1)=382 then hx=-hx

*bjmp
	tama=int(rnd(1)*20)
	if tshotf(3)=0 and tshotf(2)=1 and tama=10 then i=3:gosub *bosstama
	if tshotf(2)=0 and tshotf(1)=1 and tama=10 then i=2:gosub *bosstama
	if tshotf(1)=0 and tshotf(0)=1 and tama=10 then i=1:gosub *bosstama
	if tshotf(0)=0 and tama=10 then i=0:gosub *bosstama
	for q=0 to 3
	if tshotf(q)=0 then *bjmp2
	tshotx(q)=tshotx(q)+tshotxb(q)
	tshoty(q)=tshoty(q)+tshotyb(q)
	if tshotx(q)<=0 or tshoty(q)<=0 or tshotx(q)>=530 or tshoty(q)>=350 then tshotf(q)=0:tshotx(q)=580:tshoty(q)=400
*bjmp2
	next q

'当り判定なのだ！
	for i=0 to 3 
	if tmf(i)=1 then hantei1=(abs(box(stageno-1)+70-tmx(i))<=78)+(abs(boy(stageno-1)+66-tmy(i))<=53):if hantei1=-2 then taikyuu=taikyuu-1+(powno=2):gosub *boka:put@(tmx(i)-65,tmy(i)-65),tekib(7),and:put@(tmx(i)-65,tmy(i)-65),tekia(7),or:tmx(i)=600:i=3
	next i
*ata4

'食らい判定な～のだ！
	for i=0 to 3
	if tshotf(i)=0 then *ata7
	if chno=2 then hantei2=(abs(x+39-tshotx(i))<=11)+(abs(y+29-tshoty(i))<=19) else hantei2=(abs(x+9-tshotx(i))<=19)+(abs(y+1-tshoty(i))<=11)
	if hantei2=-2 then mp=mp+2:gosub *tkyu:tshotf(i)=0:tshotx(i)=580:tshoty(i)=400:if mp>=100 then mp=100
	TextOut 10,345," MP:"+str$(mp)+"% ",7,0,15,10,"ＭＳ ゴシック"
*ata7
	next i

	if daf<>0 then *dame2
	if eki=1 then *jmp4

	hantei2=(abs(x-39-box(stageno-1))<=57)+(abs(y-56-boy(stageno-1))<=45)
	if hantei2=-2 then hp=hp-10:gosub *daku:gosub *dasho:if hp<=0 then hp=0
	for i=0 to 3
	if tshotf(i)=0 then *ata8
	hantei2=(abs(x+18-tshotx(i))<=15)+(abs(y+26-tshoty(i))<=20)
	if hantei2=-2 then hp=hp-5:gosub *daku:gosub *dasho:tshotf(i)=0:tshotx(i)=580:tshoty(i)=400:if hp<=0 then hp=0
*ata8
	next i
	for i=4 to 5
	if tshotf(i)=0 then *ata9
	hantei2=(abs(x-2-tshotx(i))<=35)+(abs(y+26-tshoty(i))<=20)
	if hantei2=-2 then hp=hp-5:gosub *daku:gosub *dasho:tshotf(4)=0:tshotx(4)=580:tshoty(4)=400:tshotf(5)=0:tshotx(5)=580:tshoty(5)=400:if hp<=0 then hp=0
*ata9
	next i

	goto *jmp4

*bosstama
	tshotf(i)=1:tshotx(i)=box(stageno-1)+75:tshoty(i)=boy(stageno-1)+75
	n=abs(x+25-(box(stageno-1)+75)):m=abs(y+25-(boy(stageno-1)+75))
	fff=sqr(n*n+m*m)/12:if fff=0 then fff=1
	tshotxb(i)=(x+25-(box(stageno-1)+75))/fff
	tshotyb(i)=(y+25-(boy(stageno-1)+75))/fff
	return

*bossbakuha
	tshotx(4)=tshotx(4)-15:tshotx(5)=tshotx(5)-15
	if tshotx(4)<=0 then tshotf(4)=0:tshotx(4)=580:tshoty(4)=400:tshotf(5)=0:tshotx(5)=580:tshoty(5)=400
	for q=0 to 3
	if tshotf(q)=0 then *bjmp3
	tshotx(q)=tshotx(q)+tshotxb(q)
	tshoty(q)=tshoty(q)+tshotyb(q)
	if tshotx(q)<=0 or tshoty(q)<=0 or tshotx(q)>=530 or tshoty(q)>=350 then tshotf(q)=0:tshotx(q)=580:tshoty(q)=400
*bjmp3
	next q
	bakuha=bakuha-1:if bakuha=0 then *owari
	goto *jmp4

*bshori
	if bakuha<=50 then *jmp8
	i=(bakuha/2-int(bakuha/2))*2:if i=1 then put@(box(stageno-1),boy(stageno-1)),boss0b,and:put@(box(stageno-1),boy(stageno-1)),boss0a,or
	i=bakuha and 3:if i=0 then boxx=rnd(1)*150:boyy=rnd(1)*150:gosub *daata
	put@(box(stageno-1)+boxx,boy(stageno-1)+boyy),tekib(4+3-i),and:put@(box(stageno-1)+boxx,boy(stageno-1)+boyy),tekia(4+3-i),or
	goto *jmp8

*owari
	MCIsound "stop midi"
	gosub *fadein
	sleep 2500
	TargetWnd hdrawWnd
	if stageno=1 then bload"st1clear.bmp",hanasi
	if stageno=2 then bload"st2clear.bmp",hanasi
	if stageno=3 then bload"st3clear.bmp",hanasi
	if stageno=4 then bload"st4clear.bmp",hanasi
	if stageno=5 then gosub *ending:goto *stuffroll
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 160,250,"☆ステージクリア☆",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	if stageno=1 then gosub *mst1c
	if stageno=2 then gosub *mst2c
	if stageno=3 then gosub *mst3c
	if stageno=4 then gosub *mst4c
*kuriaa
	if endflag then sleep 200:end 2
	if sw=1 then MCIsound "stop midi":gosub *fadein:goto *stageloop
	goto *kuriaa

*gameover
	line(246,332)-(45,342),0,bf:sleep 2500:MCIsound "stop midi":gosub *fadein
	TargetWnd hdrawWnd
	bload"go-1.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 170,260,"コンティニューする？",7,0,20,7,"ＭＳ ゴシック"
	TextOut 220,280,"ＹＥＳ",7,0,20,7,"ＭＳ ゴシック"
	TextOut 220,300,"ＮＯ",7,0,20,7,"ＭＳ ゴシック"
	TextOut 200,280,"⇒",7,0,20,7,"ＭＳ ゴシック"
	y=1
	gosub *fadeout
	gosub *bkeshi
*gameover2
	if endflag then sleep 200:end 2
	if keystate(30)and&h8000 then TextOut 200,280,"⇒",7,0,20,7,"ＭＳ ゴシック":TextOut 200,300,"　",7,0,20,7,"ＭＳ ゴシック":y=1
	if keystate(31)and&h8000 then TextOut 200,280,"　",7,0,20,7,"ＭＳ ゴシック":TextOut 200,300,"⇒",7,0,20,7,"ＭＳ ゴシック":y=2
	if inkey$=" " then *gameover3
	goto *gameover2
*gameover3
	if y=1 then stageno=stageno-1:hp=100:goto *stageloop
	TargetWnd hdrawWnd
	bload"go-2.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 170,260,"げーむおーばー（泣）",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 2500
	gosub *fadein
	sleep 500
	goto *mn2

*bkeshi
	if inkey$<>"" then *bkeshi
	return

*ShowFPS
	FPS=FRAME
	IF FRAME>15 THEN Wit=Wit+1
	IF FRAME<10 THEN Wit=Wit-1
	if Wit<=0 then Wit=0
	FRAME=0
	RETURN

*story
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,60,"ここは『パラソル国』",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,100,"パラソルで様々なことが出来る",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,140,"不思議な国。",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,180,"そこの人達はこう呼ばれています。",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,220,"”パラソルウィッチ”",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,260,"？「ランラランララ～ン♪」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,300,"おや？歌声が聞こえてきますね。",7,0,20,10,"ＭＳ ゴシック"
	TextOut 100,340,"彼女もそのうちの一人なのです。",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *bkeshi

*story0
	if endflag then sleep 200:end 2
	if inkey$<>" " then *story0

	gosub *fadein
	TargetWnd hdrawWnd
	bload"op-1.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,260,"彼女の名前は「ナナ」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,280,"パラソル国の王様に",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,300,"お使いを頼まれたようです",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,320,"ナナ「ランラランララ～ン♪」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,340,"「ヒューン…」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,360,"おや？何の音でしょう？",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout

	gosub *mop
	gosub *bkeshi

*story1
	if endflag then sleep 200:end 2
	if inkey$<>" " then *story1

	gosub *fadein
	TargetWnd hdrawWnd
	bload"op-2.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,260,"ボコ！！",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,280,"ナナ「あべし！」",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *bkeshi
*story2
	if endflag then sleep 200:end 2
	if inkey$<>" " then *story2

	gosub *fadein
	TargetWnd hdrawWnd
	bload"op-3.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,260,"？「ハハハハ！これか、パラソル国の重要機密物とは！」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,280,"？「返してほしければ我が国『夜の国』",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,300,"　　　　　　　　　ミッドナイトキャッスルまで来い！」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,320,"ナナ「ムギュウ…」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,340,"これは大変です！謎の人物から",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,360,"奪われた物を取り返しに行きましょう！",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *bkeshi
*story3
	if endflag then sleep 200:end 2
	if inkey$<>" " then *story3
	return

*ending
	gosub *fadein
	TargetWnd hdrawWnd
	bload"ed-1.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,260,"ナナ「荷物は…と、",7,0,20,7,"ＭＳ ゴシック"
	TextOut 170,280,"　　　　　　お、あったあった♪」",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout

	gosub *mop
	gosub *bkeshi

*ending1
	if endflag then sleep 200:end 2
	if inkey$<>" " then *ending1

	gosub *fadein
	TargetWnd hdrawWnd
	bload"ed-2.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,260,"ナナ「ちょっと！王様に頼まれたたこやきが",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,280,"　　　　　　　　　　　　冷めちゃったじゃないのよ！」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,300,"ナイト王「え？重要機密物じゃあ…？」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,320,"ナナ「？？？何言ってるの？",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,340,"　　　　　　　それよりもこれどーしてくれるのよ！！」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,360,"ナイト王「あ、えーっと、台所に電子レンジが",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,380,"　　　　　　　　　　　　　　　　　　　あったかな？」",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *bkeshi
*ending2
	if endflag then sleep 200:end 2
	if inkey$<>" " then *ending2

	gosub *fadein
	TargetWnd hdrawWnd
	bload"ed-3.bmp",hanasi
	line(0,0)-(499,419),0,bf
	put@(170,50),hanasi,pset
	TextOut 10,10,"スペースキーで次に進むよ☆",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,260,"ナナ「んじゃあ、レンジ借りるわよ。",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,280,"　　　もうこんなことしないでよね！まったくもう…。」",7,0,20,7,"ＭＳ ゴシック"
	TextOut 100,300,"ナイト王「うう…。たこやき…、そんなぁ…。」",7,0,20,7,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *bkeshi
*ending3
	if endflag then sleep 200:end 2
	if inkey$<>" " then *ending3
	MCIsound "stop midi":return

*stuffroll
	gosub *fadein
	sleep 2500
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	TextOut 110,200,"このゲームに携わった方たち",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	gosub *mstroll
	sleep 2500
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"st1.bmp",hanasi
	put@(50,10),hanasi,pset
	bload"st1clear.bmp",hanasi
	put@(285,205),hanasi,pset
	TextOut 260,40,"企画、原案（笑）",7,0,20,10,"ＭＳ ゴシック"
	TextOut 260,70,"栗ラン",7,0,20,10,"ＭＳ ゴシック"
	TextOut 260,120,"ストーリー",7,0,20,10,"ＭＳ ゴシック"
	TextOut 260,150,"栗ランなのよ",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,235,"プログラム",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,265,"栗ランだい☆",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,315,"ＢＧＭ作成",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,345,"栗ランだってばさ",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 6000
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"st2.bmp",hanasi
	put@(285,10),hanasi,pset
	bload"st2clear.bmp",hanasi
	put@(50,205),hanasi,pset
	TextOut 75,40,"ストーリーＣＧ",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,70,"栗ラン♪",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,120,"キャラクターＣＧ",7,0,20,10,"ＭＳ ゴシック"
	TextOut 75,150,"栗ラン？",7,0,20,10,"ＭＳ ゴシック"
	TextOut 300,235,"背景ＣＧ",7,0,20,10,"ＭＳ ゴシック"
	TextOut 300,265,"栗○ン（オイオイ）",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 6000
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"st3.bmp",hanasi
	put@(50,10),hanasi,pset
	bload"st3clear.bmp",hanasi
	put@(285,205),hanasi,pset
	TextOut 220,60,"ＳＰＥＣＩＡＬ　ＴＨＡＮＫＳ　ＴＯ",7,0,20,5,"ＭＳ ゴシック"
	TextOut 220,90,"ナナシ様（KANTAN PROJECT）",7,0,20,10,"ＭＳ ゴシック"
	TextOut 220,120,"植竹幸裕様",7,0,20,10,"ＭＳ ゴシック"
	TextOut 220,150,"山本様（Discoversoft）",7,0,20,10,"ＭＳ ゴシック"
	TextOut 55,265,"ＡＮＤ　ＹＯＵ☆",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 6000
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"st4.bmp",hanasi
	put@(285,10),hanasi,pset
	bload"st4clear.bmp",hanasi
	put@(50,205),hanasi,pset
	TextOut 75,40,"栗ラン'Ｓ",7,0,20,8,"ＭＳ ゴシック"
	TextOut 75,70,"　ＨＯＭＥ　ＰＡＧＥ",7,0,20,8,"ＭＳ ゴシック"
	TextOut 75,100,"「マロン」",7,0,20,8,"ＭＳ ゴシック"
	TextOut 250,265,"http://ww51.tiki.ne.jp",7,0,20,8,"ＭＳ ゴシック"
	TextOut 250,295,"　　　　　　　　/~kuriran/",7,0,20,8,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 6000
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"st5.bmp",hanasi
	put@(50,100),hanasi,pset
	TextOut 250,175,"パラソル ウィッチ",7,0,20,10,"ＭＳ ゴシック"
	gosub *fadeout
	sleep 6000
	gosub *fadein
	TargetWnd hdrawWnd
	line(0,0)-(499,419),0,bf
	bload"thanks.bmp",hanasi
	put@(0,0),hanasi,pset
	gosub *fadeout
*paraend
	if sw<>1 then *paraend:sw=0
	sleep 6000
	gosub *fadein
	sleep 2000
	goto *mn2

*fadein
	TargetWnd hMainWnd
	for v=0 to 9:for x=0 to 50
	line(x*10+v,0)-(x*10+v,420),0
	next:next
	return

*fadeout
	TargetWnd hdrawWnd
	get@(0,0)-(500,420),hanasi
	TargetWnd hMainWnd
	put@(0,0),hanasi,pset
	return

'回復音
*kaihu
	MCISound "stop shot":MCISound "stop bomb":MCISound "stop boss":MCISound "stop kyuu":MCISound "stop kaihuku"
	MCISound "seek kaihuku to start"
	MCISound "play kaihuku notify"
	return

'ダメージ音（食らい）
*daku
	MCISound "stop shot":MCISound "stop bomb":MCISound "stop boss":MCISound "stop kyuu":MCISound "stop kaihuku"
	MCISound "seek shot to start"
	MCISound "play shot notify"
	return

'ダメージ音（与え）
*daata
	MCISound "stop shot":MCISound "stop bomb":MCISound "stop boss":MCISound "stop kyuu":MCISound "stop kaihuku"
	MCISound "seek bomb to start"
	MCISound "play bomb notify"
	return

'ボス固い音
*boka
	MCISound "stop shot":MCISound "stop bomb":MCISound "stop boss":MCISound "stop kyuu":MCISound "stop kaihuku"
	MCISound "seek boss to start"
	MCISound "play boss notify"
	return

'弾吸収音
*tkyu
	MCISound "stop shot":MCISound "stop bomb":MCISound "stop boss":MCISound "stop kyuu":MCISound "stop kaihuku"
	MCISound "seek kyuu to start"
	MCISound "play kyuu notify"
	return

'ＢＧＭリピート
*repeat
	if sw=1 then MCIsound "stop midi":sw=0:MCISound "seek midi to start":MCISound "play midi notify",sw
	return

'タイトルＢＧＭ
*mtitle
	MCIsound "close midi"
	S$="open "+chr$(34)+"title.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	return

'オープニング＆エンディングＢＧＭ
*mop
	MCIsound "close midi"
	S$="open "+chr$(34)+"opening.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'スタッフロールＢＧＭ
*mstroll
	MCIsound "close midi"
	S$="open "+chr$(34)+"stroll.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ１ＢＧＭ
*mst1
	MCIsound "close midi"
	S$="open "+chr$(34)+"st1.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ２ＢＧＭ
*mst2
	MCIsound "close midi"
	S$="open "+chr$(34)+"st2.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ３ＢＧＭ
*mst3
	MCIsound "close midi"
	S$="open "+chr$(34)+"st3.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ４ＢＧＭ
*mst4
	MCIsound "close midi"
	S$="open "+chr$(34)+"st4.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ５ＢＧＭ
*mst5
	MCIsound "close midi"
	S$="open "+chr$(34)+"st5.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ボスＢＧＭ
*mmboss
	MCIsound "close midi"
	S$="open "+chr$(34)+"boss.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ラスボスＢＧＭ
*mlastboss
	MCIsound "close midi"
	S$="open "+chr$(34)+"lastboss.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ１クリアＢＧＭ
*mst1c
	MCIsound "close midi"
	S$="open "+chr$(34)+"st1clear.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ２クリアＢＧＭ
*mst2c
	MCIsound "close midi"
	S$="open "+chr$(34)+"st2clear.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ３クリアＢＧＭ
*mst3c
	MCIsound "close midi"
	S$="open "+chr$(34)+"st3clear.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'ステージ４クリアＢＧＭ
*mst4c
	MCIsound "close midi"
	S$="open "+chr$(34)+"st4clear.mid"+chr$(34)+" type sequencer alias midi"
	MCIsound S$
	MCIsound "play midi notify",sw
	sw=0
	return

'敵出現データ
	data "010010010010020020020020030030030030040040040040000000"
	data "001001001001002002002002003003003003004004004004000000"
	data "000100100100100200200200200300300300300400400400400000"

	data "010010010010050050050050060060060060030030030030000000"
	data "001001001001005005005005006006006006003003003003000000"
	data "000100100100100500500500500600600600600300300300300000"

	data "060060060060030030030030040040040040070070070070000000"
	data "006006006006003003003003004004004004007007007007000000"
	data "000600600600600300300300300400400400400700700700700000"

	data "010010010010070070070070020020020020010010010010000000"
	data "001001001001007007007007002002002002001001001001000000"
	data "000100100100100700700700700200200200200100100100100000"

	data "010010010010050050050050070070070070030030030030000000"
	data "001001001001005005005005007007007007003003003003000000"
	data "000100100100100500500500500700700700700300300300300000"
