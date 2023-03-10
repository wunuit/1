#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY??' ???????????????????????????????????#~??B??*7?{??5?/W݋ϻ?wu??]?{so}?{?}{?S????|n??}׹'n???{?o???^?W?]?Wn?3]u?????by????b???}y??w;???y????S? &?	?1?51?Ѧ?d4i??M?L M4?LMOI?<4?6&F	?4?4a04???4M?0 ??& bm*M?4?mL OF????=S????a?2a2`????4ɂ0?zh h???&'?h?4?6?F??<FD?&G??T*?&?m h??hd????S?I?ڞ ??@4?L?h?@??e6F?ѤLRy?cSd?&?"xT??53?Dz??z4S?4bf??SA?ɤ??d?L????52mM4О?	?~?M???O?????i?O&?O?h?i14?6?$???)진a&5=S???d??6Ҟ???BhF@?4?d?SL???=	????M
m4њ?Lh???fz'?L????????x???????SSɔy4?fE??6??S??M?SM?ͩ??F?@đ?&?0???????????)??yO?LLCMOjmD???Jzdi????2?????'?6?MM?A6?'???h??!?ϲ*?2?o???.\??r@֘A>i??????	3>R???R??d#S??<?S???@@R???"(??\ɶ?5??pD ?? ?n%??`?!?R??)???i(fKJV??JR????~H???	?Qc>?2??KTĊW?}???	?o?r?5,.?EP?v???e?a???&n?"\?8??LG"?DjÀ?w/??ôƃ? ??m?4???2Ȗn?????X??SBmM?D?F[?cܦ_?4?<??F
?L?̙3r??O???
t32?+??^\?#"4?ofm\ЂJD?)5A?\?.1L'&`?D?"*?Ā?74Dۄ??ב?v??m?ۅ)?9 N?LėP%b(?/????&??  	?U?@oho6???!	?5???܆YHB?????y?%?T??"?????~???[????)?????|?.????+4????>?E???c?8?s ????$^i}??)U??r?/4M&????a??# paP??MbO@?ȖI?2??5
t?g?_٘tFs??}L???b?7?ik??$?m4h?	2?29K?????n9?9i?|?cU#%#4??M?1kmJ?	oA @?@?H?@? ?DD _D?t?z???!?@7?????0fA93?$N ?@?$H?l!???l?.	iQ?It }?u?]Z??PF?F@?
s?:%?3f3Ā?#??H ??%j??lz?W??˳?kP?D?f2?vH5]*??Г9c??ߗ-?V????$?L)1O??a?????.??D??$ByākV?@4|.??Y?vC?@ڢ0??F?ȋ?!?q??? ?? ? ?C E?P?@D?0????$?z?H/?`@h?I??????P"5??0?!?????ף?b??R???7kf??>?@?)bF??{?ǭ?/?nB6??/?u??	7??@?H?n??I????gS4jl??V*S????9*?sJ?K??h??_???ݢ)eX???	?>?y}U?1?*s-?*.?)????-?z? 8%Q r찮>??c6ؾ??TF??b???x@4??"??fF0a#_?wr?]?Sc???n#???H????dc.3~N8?ŠȈkLy??U+oO?}W???u???y?x^?X??????')???????̛??????-?>'?veD?p??t??????E??W???????j؄??1$;??{T ?@???????#?@Y{ݓ??5??p@r?l{?? 2lĀhwR7?q?9???t??'??l?B?P??*?ǎb?Ab: ?G"B*??wn??᳜`E2#z?Οj?@?I?"{N]?unP??~:祑?{?ɪ?n?2?5i???1???R??3E#N??J?%??b=?#??!
??s??95?+?A?||?*E??????c??k?a[?????n?9??????[㙂?,?>SY??{?Tͨ?n&E?{5}?6ϫ?0????R??I=??%?&????>c???h?k???zv???웃Q?v  ?vl??7'???H$P?O"??fW?s}n??L????8R5\O?????YW?????17ie???
Ab?7?????ø??:??a,??6?
??v?&ɣ?F?ɼ?D???W?????UY'E+.k??F??#,3N	??f??I"?9͹j??<???????)2??6>??? ?Lh??m?;??+?????\!@gx@?f?T??0???T????}??????筗|?۵?:y?E?mI?4?????V}V?~?Q???? ? $tQ? ?}?????c$F???>????<?B??f*n?J???f?qmaQ?2$6?A?R?#O????,6???ϫ#?[ד?C??m",??]Ύ?%?l?????}??C?̯??)/??b0B?I~????&ǀn[7???}v)ؐz???y?#????>???$c??J???n!91 C٠????a??}?T?K?;?????A?+???,???6wF?)}???;?j?c?????F?:$??5i?:)k??I???
JI??d?h????I?\_???????? ?3)z???????a?@$?6Q$7F??????cu?a??Ua?ng??O?­kQ?.2????2fCB??B?}?]?o?a8a0}v\+4??Z\??iBw? ;??k??t?[O??ݬy??E?????u?:??5?l??x0Ў?oݪ??4?????F73N?r	? ??b/谹?j?(``t??????z??ak%N0?t<y?????4G;Qx?/;wmD??Ni???r?#F??ڮšD?5?c??   ????#+"?[ħ?'?;O{"?ˉ???p5?#?Fq'?7?C&s??n?9??????vӇ͙? ؗut??V?????D???4??PK
?\???1??????aw??(o?ϡⶇ?	`qA?xf?<?+oB|V??؏??k?7E? ?sR?????J?P4g??]???&??͌ڴ&.?w?"?7???st?&??a=˨?2?6D;k???[.??T??	8ˢ#??!???=1?a}?W??????????X???A?s ???8?f[???N4??4J<??a???i?[2???6ژ`?~؀??5??q???90<9? XY????HRhk_2???????lw?Z?`h?e>?????zfD_??&l??!.?[HeU??3ȱ?~'}V?????[d????j}X???g?֢ h	????<x?O1/?h{?!U?=????:?Xy_	?i~??[??????A[m~[?#	???<?h???x{????
?4 ^r???/~?t?һ??U?J????????|?%Oo_T??׆?,n?YY绱?v[ٯ?s{?W??$?˓'Kx?? w? n?????٪?'??kk?Xߢ)Fc9??A t?t???q>+?6z&??X?c??D??4H!??o?q???kv?w?????w?k?P?t?:??v???}??^QC????ϓ,P?%?A??56ӿ0?/Ue/????5s?Ѐ???w???g????fw ???kI>?Y.o???Θ?Z??і??l?U?Qa???t?+o?+?I???,?T?kՐ??U????9H???}y???Z??+?????$??$??V?Ɇk???Xpk???M<?5ʺ???ئ?h?Naf??????@?B????????;o?Ѩ?R?:?LZ?U?U1Uu0??z?h??N.ˁK??i ?(?hF?K??T*?ٺU???[s?R?Ժ8uzx?oh??^Ob??OkNI????????u?o??i??X??	?aa??v?j[??XR`?=???C?S|I??????iDū?Щ???vv?????i7????>??d?\?&r~?
N??`??L[迓??_????8?s???]5.?Ό???f?l???<?ZR???,?f??Sc&K???7? ?????Ixx????j
?S}???S??,?/1??,:??M?%5?4-??3k???N?I=??\? E:?????wN??????	?f\?d\???f??B?{H???W????$٬??+Iw?j?{?8??nӳD&X	?Ӂ?!??s(M?oB.????|ZB??+6???g?????yZ?).?w??{e?M-?@??{??R
?? ˓_??l!?tm???????5e???3?\1??w?qv??F1?`|D??!?Ȓy??[N??J??a???*y0w??cF?x?Utj??fu&;.l?t?ܝCo?$
?-))v|?H?2?J??r??V
?????N??Q??9俣???x ?Tw???X??1c%p}?I?3"?޸?????82\,?\??l?-+?"j%?i??o????)I?TW??2ST?$_͓ł???
TVf???-#o1"VМu?o????5??*?RF홫}.ym?ś?v?z?????Ս??s ???~:d????7??e?M?L?ڥ?]?A????+?? ??_???9=??ڳ}rr߉??_̸???)O5
$E6Y?$?>ӵ??ׁ?%?޹??z?e3h??p???-???e????A$֞?;?-E)1??Z?q?-?n?מ??Mɧ?T(R??p{SQßW$?F2???dN?-v?΢?i????T?Sl?AZ?彩?O͊vD=aϏ??W?U?,???&?(?;??yU?Xᴙ???`]E9{%%0????ig????n]<?yݣE???\U ;?!m?9???S??vo%????????5yۆ]?J???S\?K?nG?:??|?<???Uo@?ŋ???ue?w?N?&-?*+$I???'b??W????4[(+?=gT?|??Y\\??? 0eL???c_?&m??GW??iS????@8?z??B6ۃ??n??D?	??#-}??????j??+??FX?}?&f?^/???Z??d??v),?^???r'X?%?Ji?)6?/?+???-CiU??џ(?:??R3K??g?E?* qo? ?D? S⻗z?C3V???m\??SGԸ? ?@????Vm?t$?%?h??>??<EN???|i?R[x??J?Q`)T?  n@?W?!???gvmj???????)?*8?3L????ݠ*?hU0n?:4?G?^?X0 @?@{b4?Q???FO-Y???/?~K???u-???????_ߧ??;K??%?`?|?r?&????6%???U?_?$P /????W;????? j
?d?`??ֶyr+ܩ?7???Ip?????rG??3??՜n???? ?4+?J??&[?Z???,???u????*?k??#?yg????Aَ??X??N???C??????W????(?????n???ߓ??_ -Z??a1?!/????????n?wnb?2?sC??%?jm7H?Ra?N\'??c)?-?QR?om?2?#Z&??̮ؿ??,A??w22+	U?Ww?n??N$?	???f?P?Bi?zg???e???d???o6(?NL?_i%??	x??F?C????y??Q?9+Voص?*?????"sƤ??z? ??u?????Ф??2??|N?{??U???]??+ ??????*c#?ד?^sG??dՁKˉS?琪?@??ފ?d???_?k?`??;?io?vfGk?U??j????????Ѹn???Y?Fݝ??7?Z???}q5?1??T??B?? ?xܑ
S?-???????(?zUr#!2F??ۺ???lW
	Gߴ?6?v#-Y??X-?
??J=?x???\???x??<1???E?Z|W?~?????W?S???S??,?!?ݞܱ?3?'a@???ɇY????$	-?0?ľ?<?nD˗??????f?r??5???t????i9Ed
N]~?<?u???Z?*&???Ѳ?InB?j???ڴrv?}wᖹn??y?-t}??{?qQ?&??D?;?(Q?j????s?1?2??>????n?ן??Nн?e?'t?7???j???m?5 ?'W\	?!O???k?q=?HnG;(?_΍Y???kӠ?J S????<?G?a9=?B??H4h$N#0??X4h???fF??B????????-?ݕu???J??m?G?N~Q??:?n?'K???7i?͂?	ڜ???>??x$??E??*j???mTVI?H$?[Ӱ@?\?hV??iֶ?j??1?\m???????"??˭G????Ami??K?M???&x???k䝍??2`J|???~y????b?ai?9?lkM?m?=#3?{?g	??Q??o?œ?pf??Ef??'_?zX?C??\v??????????m?K??b2`???b?=??l*??u???Ѣ?$?b?????Z.G?.????"??(????y???C???b?=/?9???G'??????`u;???,L}? ?j??:x?????H?|B??O%Y?????	SpPa*?GlIW??????c?~?dͨ?]:|$???)????2?S$??pg???c??#}{?`Pq>?kF?Ld?<??Օ?7?l'9??QT-?~^???7??m?>????S??5??o????Z@$?0G??MP?f5B?SM?'н^;8#k??; b????9>?ߓ???:?[u>}??[???????'~+q~??N_!?S??\?R.:G???C???,P?)F??h?@4? ?@a_d?~fʰF??	????Z????r? O?"?&u}>?s??e?N"?#/?z??~?N?;2??Es?Á@A[??	@?@??n?\ՈrID_??hL??)???? ??r+?w?ȄP?%Ϸ???'-`cy\0? ?? ??
|W9?}?vj'??d?(f.?>l??)?M?G?:/??0H`	Y`?$?\j3?e???????!Ah!?? 
U<&*%I3c<ssu?7?????[??¤?y`V?Rg?wP7?3??b5?⺜2zD???~?????Pc??;?Z?ReH=Dy?q??z?jт_A?L?RC*?l??d???9???T[??K???n??|?'??????إ????U)Pu?g?N???-??ܴ?L]??1??'????
??ɔ>??z?
???d ?T????Ř?)??b!????? ??QIt??J?j?A?ѱNdK?1??446?$2??I???F,????*?㵏0?H?ާ??`l?a???????:?C?mi???!??R%?o??Wv?????R??Zy3.7뜸?+??K???? :?^???)?h?
???옐??? ??p?M\?Ι~:U????m??3????????*???9Β???K? z%?Cn?????????*Ҏ:~??M??<?u֣?E7??I?q91Ħ??\4?,ѹ?G@o?????????A?Ⱥ??5?Z??o@D????mj????4??`? ??p??mw?r~(e???o????$?n??$n?'???!???̴?Hv??????v??@?(????9?J??=zCE?k?v/ׇ01e????<+$Ѣn?5?ܣ.247%wR? 4?????2̳?Z?|????Ҝֲ\\??????}?A??h??ɲ??~b?????????!~aDY鑧%?γ3?p?PQ????#??{b?f*T? ?-?s??S)^x^a???/Lݥ???8?\?t??#??.??}???D?9?E#΀@?Ų??;?|????c?;?jw????(f9mnm!ܭ???A̧R?g?J?
?&I??h??l2?x"??~??s????1???Ix>??##B2*I???b?L?Fv+s[x?ǆ??2N1?jk?????????w?l=?ӎ??a?B?>???ƯZ%???`iC ??s??0??w?????d̠%i;?3???????B?u????Gp???-R?5?g@?????? ????ޟw??F???+?
O?a??ʱ?WЬ?????=v????????޺??????T?=L?3?????S???\D??????v?u?t???o???h8'?<w??	I????Vd?⢾?z'wܼ???p?-?U5?dX?B?ΜP,??T?Z?S??N??~s??D????5W=??J?l|-}+????	?u?ct3=w)yoX?;M???????M??G??*?a???jށJ?=?ؐF???@G?`n??A?YO??*?z???ec?c$  F?W<,F?`?????h?Wqg??O?/8ͯx.?FL?>?W??df.?i
2????C?l%??$l?d????Y??Zl??c???r.??O䩓?`???n??b?Ә?O??"????G?wN{|???????????|???q??̯Ꮖ? ??? Z4N+?A?? ??̩????/???+????e??gX(??&?19?=?[?¦???`???&?????/!{?h?P?<(_w Uz@????@i:??F?!?W?s? ?'wBi.???4?c?ʸujCK?ELKv?]???s?}a|N&????  ?Â?7K~??O??D?k/?????a?~n??b??#z????A8???wo?Ȁ?GF?????????aq??]??l??-=ahh1?^?????e۷?n}Jn??G??*$??6?Ȃu2?????*r=?֝ X@6?t?$?.?????????*???Z?f?????&z?k?+?t}???kBk?ng?c}۱????@??sbCd_??)+h??p?M?-SұFu'?1????8??Ƙ??9?*???X?v??p<?
??Q?????1BPB??!)r?C??-?????0?S???2B?v?+'??wl?`?Z?+?ld?{ӝ_?t;??C?????x?5?ϦC?b?}V7V?#??Q?StZ??xOKt~mG???\x<??+OK??(?MuKP@?{??v?
F{?o????>??/Xۙ?dy?G|?(?%S	ņ?`?z?'?s??dH?mm??%?V? ???%i^?@^????|YG*??b<??4h??v9?
??uI????G?L??????K{?F??W??8?At?j0??8j?؀ěW[???MŎѿ2?&??o>tdЅƀ?>??T??nk??lN}?p}?k?@맧1ESjc	s2*?MQ??i?+?N? ~?'???V?j????
7bnor}???qxI?)Q?T?-O???i? ?????h??s??tW굽e?2eg?c?5?T?0?'ndT?N????f
G?ڮ?Ҭ??Uh??????Wѽ???xV?`c??M??X/?a^1n???I?$\??[?]F???{??w???C0???|}??4???]?????^???ڂ???I5?^?w???n/>?b   ???8?*??8p???A???n???Y???,4?E?P???L??֫?????=_Z??*?&???w|ϻy%C??%f펧?c?`fI?߮ۼH???????#?u??/?????T3C?8??b2qPgL??y???*???c?)(fix?cΜ??S>??????bu?އ?IFC?DK'?ii?,?&V	?q?t$??`??+???????y??Nl`?l5??????SA]7??g???d??;???D?˸>???$ZZ)EĤn!<??j?????q???9	S?????5+E????8dm~?2??vK??E?
4??k?^???}%?_????YtJ???B$??.*??oQ?h?8Q=??????fZ.h????Ibȩ(??<??j??=l?α???\_?P??`:???u=?}E9~?U5H??y???a?????p?i^?_?Ǣ???"?CI?TvkQ???`n?;S??????ŚM????˃/l??g??????`???|6????E螐Z??Ǥg????^?RJt?*l??t?u??ֲ?w?ܩ? s?x#???b=???|?t?l??!ZE?M?H??[?cո??Sa;?wk???A?0>?S???:i?E*?'?
?-f?.??0IgNo??F1&Ɉ??????Z????E?6??o????I/>w?v??4????>???Cc?{S?m?e????A??????T?}"0O>{?E????M?-?̍?sD]2??Ϝtt??7???H1??8??[a???:D9??J}??g?OH?;??o????%????ν?z]0b?y??_~?̧l??g???؝?/=LXR\???????Bd?L??|m:CeȺM^???ᖟ*??ͨ?2Ҏ'??Hyc??:???eL46K???	??-??F?????o?cBt%?
Ӥ?&??d???>?'??:?On4'???t???]????˳?E\zz?%?r%???RnRJA??????? JSnF	?	??TW
%l??"඙??)???p?D[jt8?Pmp??f7??*9O{l??????Ka?oL?????I=????Fk3?H ?͟pd)Q?5oF?%Sg??`^??? ޭ???????1????o??Y?Ā???x???ڊF?GC??3?۔???\??????<??M?? ??=)0?ra??9e??????@???βwI? ??*M?q?NS{?0_?5!??t?[{L?+}K??N????????0??"9??+?R? l????_v?????fS ?deӬU??\??:%<u?從??\"Ư?ɘ[u??r?3??1I?An???Ͷ+V?w??%x?n???_R	?a????n >P??4?Yt?ĭ?????????????䐡 3??өQE?7r??l[P&5ld?m^f?]?9?A??W?%?6]m??r
 q?}?Hc???s??ʹ?>??4???C?~J???0b&?;[?q{z??Ǡ{?/??`4?Xƙ?  \??:5????s?}.?;?;?>??????ԎETѠ?2b?|?X?v׽?O?bm????É*?eE]'_??`1?????v??<???_tz\?o]|???2??d?gɦ0???S????2?
??.????m]0?Xi?d??V^t3F????r??%8??ڻ&??u???_.?&?????\?h????=y?7% ?
?v?tJ???/'?~?y?_1???,R?K:?j??1?q??(u??m????Uw(?
W?:ڑX?-H??mj??^Y?@F,????l3=??????q??E??R1F???Ad???#?G\????#??#?ߝ`z?<?M?@n?L??_
???????oh?5?s???Pl8i??.?oVɯv??_?.l????;???5?e	A䀻u??ٕ?"ƣ??= VO6?Ë(???V?m??\??z?w/?(?wb??|?E???????O??QҤ??%??͈?7Zr?{i?????o?L?a5?i???CIc?O~%?s??Խ????x?v*??R??????W???͟;????????#??|???r??D?>???j?X}?rD??+\?*???fE??3?F?=???G??~????I??U??]=??`Me? ????CŻ???? 7??yO???H??Si?~?+daT??&@?A??Z>?d?????!j?Tm??R?P?ύ?_?z?b?L?ߚ?x7?$?%??M[i?7??????i?GW???_i?V?&h?b5ҩ??e?CO?v??SW??¿l?钝Q;˚??V<$x:9??R?*AҾ?gb???"? ???.?C?!?y/6?/?=k?Z??????|?Ov?x(dzH?w??[6r?n??X??9?KUlU??????;+?rĔU?O??g?$2?I?h ?<8(???ዻga??	е?N?Lzn?????XKu?Zt?3????e	WKՓ?
q_???[|???X{??f?????v?V?\?4?^???K??3=u??T%מ???	??.???+ôt;4 x|?;?%(	OS?B???????ηf??
a:{???L?X??T?D(Y{h13M?B/kf=?I?b??????̲?ʶ???y???yw????|Ge???9??oH8??k?Q???
u?GI????Кd\<???x??=?~???;R<???????"xc????;?v??VÇ F3?ŉ?A??? 1}2?P?; Ϻ?l¥|H[?OBxz?͙??O?6c???P?pǖ??xYm]Z?9DM[?&?j???d??H??t????3?Wxl?Z??L@U3??Y?_?a?T??u?')??L?ϖO=?????<?V??E?.3??6?ׁt?6K?z?:i?????u?	?T??F???HK?n?snv?J???u?*??????c֘?m??ɽ??3t%???dv?~?P?Y?J?X??$?sޗ?&&??E?e'??Ns??Ao?ZYQZ???q?&_?0??pB|??ٶ?b???2?uf???-?KzR?4?I?ba*LK5n?=??_[?n?m?N?i?? ?p,??%?BrPI?7?Kp??kX???s2?ʲ2?YB՚?VFŀك?__?R????O?īs?????l??6m??,L?l̌5?#?o+??f ?}??:?.M?Yefw???3s=????ͦȂ?????????`?????q'??#???
?????}??;D?5Z??+???f?+??ki?^???O??ƍ????Xr?쐯?Z?n???s???wo??ok?:ݳ?>??c?n??N?0??$?$???҆b??G?Y?+??391c9?+???R?Y芈???gǔ?[<P????6?х????J?8+qv??????????'m@?u???!zg???>IX??? $;??W6?G?|?Lv5?1??]?:???0?]?\ؼ?GcJ??k??????ue???P?֘Sk????5??2=????@a\s?=63??l<???????y?۶???ۮwe??t6 M?H?]?2?~J?Ė?^??x???1m??x?r??Q:+?jr `?Տz?v??ȶ_a8??nN??h,?1?ݘKjCX?[\????t?E7W56????o?x?6lHL-??+?>?_?YT?ל&?d~Z+dp??Y?K?b?(R7??2??+?????S?R?I8?B??v	????????$????f]??	?????k???&?ε???]*?<?7[?ױ?n)o?k????m??FB?j?hp?@??????/w??t ?A5???X#? 
mmS?bI?D??/?X????Ѿ~,H#?b&YG?????lH¢??t??Wjy??P&?t5BFN)(??:?R]??K?d??A??	?Q?ڥ1? 6???`<icN??F??ЇM???j7Z3x?ꁂ"[?y,iMCl4?!????(Zq??mt???????ҧN޿??|/?c?, ?='??.??p?!??N