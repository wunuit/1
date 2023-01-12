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
BZh91AY&SY�m�� ��o�� �����������@�D@0  `+��g�﷯��'�+�]���v�s��u���z���j�cCt�#ǌ����"�ܧ����ol�hծ�w/m�$�ԾۂI
a4j0h�1S�G��ʞ��M���Q�Q�z���������� �h�!O�=O!4Dd  4&�h� ��5�P�=CО�hh �   hm 4  �R ��)�*~����OQ�S#�6��$~���2h�� �i��%&�"zi��7�چ��S��zF�=��  �  `�!  4i0M *~By4j����~��=MSA�C@�halL2�����9�ȱ���FGmP:w#�)��꤫��9ΔXT����Z���{i���ͤ��I}\�\�kG�&�2L�N�e�������������)"�n�������}1�k�hdBpG�C~����\K%�{͸��ki�*�_��a7 �]�����31F����jgu�?�h�S�5��(�j��ldv���!�T�`P�>��%v#�	"�u)�k�Ք�UT�A[&�1�u��{�CZR���u�^��^�#�o<#���=����O\�#��lI���ϓ����ݺʗ�b���)$�!�`z9��Y�9l�a��C0CV�s�j��]*DaѮ�FNVW����B�B��ꯘ����1����$��6�����9�K2�5��rZ�K�W0��	�-�!"��^�FT��<��n�;:Nj1��,�H��9��J.:�} ����]]V�V���޷���Pg;ڻ!z�"�O.��?�΋��!H6twr�q� =@1z�Բl9�3�.���d|�7/�����ޮH �����14�3���h��*�G�I)L ɖ`s�p"����������>�vq�#'L	#2J�����kP �N�a�y/�U^+�i��_��=0�&i���!��=a2��?��j��Bdը+#/�����کUEUUUUUUj�\O��c#�2d0J�23�Z��yi>��.���wec>��B��n�A�o*������RVz.��q^�~���������EqW,ڿ_��g�%"6@�0�V1�:��Т������<J�9�;��._����¬ҍ5�t��%�Y\9(R���L���v�X|�o}[%�]�Cxg��c�6��ׇ���`PiS�>^�c�,ТV)�aLf�TW������3vQ�ڷMGu#����K[��%�ԞΤ#���ew���s<��3��<�pia)�ԏ���6*P�5��
:KЈr"���X�c����4"�����@��mg���ٶy6>C��n��g�'@<�`���O�`7�fח<�y�$؇L����|U�����=G�<	�L�yJ
�Wf�{�+�nh�<uI�H�/Żۃ���(��=|8 ��Ā��ن�t���
[�G}�Ҝ�)Y�]k��0 k;����n�In$�J��^�}4��@oUN<�O��q�\�[)o۫ך���"�fHC���k��
a\K#���@���Ƚ�����*(�,���p�4��'gW��nZ�׫Ë���z���e��Qe^}$�8S���i-�8��~�4��"%
�#S֎͜�i��ak�q/
�f���P�u9�Ք���'��n���:1��H@�.z�&����б��X�Չ#5\#O�ퟒ%��n��i۝m��R,Zza��;�ł����Ac���L�X��}����U�ẃ
`�w!�В&��R�.7�
�QdK�0��>��/!���&TP+Ey]:�;0u�e��Jپ�P?���/�vdUV���{˴���:*������X�O+����4�H� ��HºkGJ��	�|JH���LIԚI�ʈ��lOmUC+�o4���("�a48{Y�p�������"�#}���[Fzf.��&p�}9�ϒ���(�?�a+A��;�(&	@��� AX�/2�1m]ĢB�us²�*;��+`�#�j���(P,ThP�c�sï�.\k1�v���R�d��D��5٫sG
��ËFY*��X���@�e��:ǃ���>� �3�7�Qp�ܙ��X`��o�8;�r����wкk�S+�������@Z/�Y*YT�Zs-.�{�53��	j�f{+1}@��@Y�PP�w��P�08#
���$L@q�OG�A�]g0���A��^p��5��	���jA�<u���6E�hmH�uU�۴�]rl\�V1�j��p�D/E��e+�@��*���@ѫ;N����e����	1�ň!\�E��:��͠ ci���,�?��u�޾b<�4�絣�A� �;N<W#_���s�C��Kv��VL�h_����	ݢ�V�A���a�v��N��N��׳���j���1��_��/�n5�G4M+8�_��鱕�(A���\�]V��^ota���U<d�ZX"Y%�I��&�&6��1:����G��+9�-����.���L��X����8_���\��]*.��#����H�#hYP��%�����)�p��N펠�	 z�������>��L,�8=����V��ク�ﾱQ���M3j�i[j��ۦQ������<���[]
�������3V�1c�ԾD��Ԕ��J
�fvc�����V�9�Q�u�[aT�&	X��yH�� �����Y�jԚX�C���l(H,]� ���^}�?�뙠3���"�)�9E���_�!�[,hA�2��SUZ��>�;�(=h�E���g�!t�(�pjqn��K�@����0_��T<3��U<��WS�0071�c�L&L6[�[]��d�4g/��5h;���Q�g��Z
�\�Kv�	�3(�0li����e�դ��y���jbM�	�f�+fL3��g�fa�A�ڌna'̰�uӕ�-U� St7_�E1#�'N�VB� Ep3rҒ[!~K�]&l�a����TF�Wi�t�H{q=&E��C2�h���~pa"��~ɰ�!S�q`q3�"�ோX��6l4v�}DI��+:�-����2�U��Ę�A;�u����C,��yƐ�I<��^'�p�MmU�ڽ��mI��ã .�(V#��?1t&��4���\�P��V���V��S�p���� ;��u�ش��\�T�^���9E<$�P��F�	�A_�*1�F~'��:�S�Q����=!�Kb����M��{g����mUJOQ*Au�ۓ"��Z'إ��<���)L
�k��B��S�q ��9>�&�����l�I5�~�����s���q"^>Sf�4�.�e�Y��Bv����qgG�S	�:��\e $i?^�ʃ����+�b&�c��/a{{J>�1q$���V�5Н���B���#bC[2ڦ9�tGJȡ�3�;��y�8`u�΍�ZvV�<��};{+Ǽ<d����-��a�4�w���XdqST� �8�I�]�*eˈ���3R�Q)5X#PA�p����w#��l�V��d#\$��9��N��AꤞU>ڍPS�гr�Z�xZ��B�	4�}A�<�m�~V��&LH�c�$_R��UO<�8��P@j�2c��.�>5��À�1$dL�`_|��A�*�E"����]#���T��Z�9������؅���@bH���F��s��3Y�i��E���M+Q���8^�@�,��(c$ԀgI:q/k\���i,���DtKJ	rm����ܛ�`���w�σ��,'s��%��N�� �~��j%��Kx.���_Y#
��VH���DB�Qs���8�e�J���ۮ��	͸�A��ۮ6A�iJ��˵�]<���'�6�O��M�VV����sk��TR��'�]D�^��L2&��)(F��* �O,��C*^Wƅ��ȃ�J����F�
7�O`��:�<� |�vV1/�R�H�a�&��gw<6�7|<���E*��q6�s[�T�]�|���p�u��UKO���+a�
~�2b��c���7��8;d�6��D*�\-�3��`���1�p#`!:�e�[~�Ύa$_oe\�!	�.F�1Hz���T�`ɕU��"�
�@�b��։�T��YP�w�Fj� �L)C�ȤDDI����@�5�61�H��� >4�!���+���� ��v��D%"��t!"��Ѡ�ۥ� ���"L����D]|����%����؂[k#P(J�wj7�D�.s1���T��BFB�D]H�$A^�R��$"�������[$ZP��8ϖ@	��ȇ���uH}�o����B��K���r%�&bS��6 c$ha�X�>R@X[(93*׉$� صj�a��Ck޻"��$H�t��U77��u�)����AdL NJ��-����B`&�8^��Q`Z��@H��[Bv�W��+ޖ�xtT}g\�%�a�T^<#7�n�s���%�^×ur�z� �a��=Q�SaEQEQH���DQEQF1E��Em6�2�<{y�<��ZI��hm8����T�"��b>���	@܄#Ƶ��p`����֩�#��R]ȩtʟfk)%�n�L̃�b��	G:ZC] ��hȐx(/5+��Kf����-mx�Z�g-�`����u	�3��1��mBB<H�A|Ka)��Yq1��
K�\qUAXψ�2(8H����*$���9LQR	s`d�����-痣1��z3��p�w��d��m�aC�]�&�h&�
1i%z�n�wj|]b����JQ	60b p�����tO�3�N�O�� �R3��*�G��$h�1?	fBXBN���:�)��Xӳ�CJ	�僼}U��T��֓0`�4�h��D��F���b�d:�P�K@����#� ���;o,é�O��Og��<�A��%�4� !��y��΃w!��"��a;ԡ��px3�&V���E.�x	�b̪��)���.�+��V�贘$<������� �숀`� �XcL����U��.�0����&6��2r�^;�%)�b\o
CD��ATI�R����&����a�`�&v�n��-��f`by�qR�ij�
@!�뛯����(ւ�&�eo�a[�M�c�8�\�L�}|�!�hB7��C�_-
��^뇗]�	��@���ع�uL�Ƅ��o��-����b�DE1:��d��K�P6	TوA��0����9z������>nY+�̊/���B	����	x��GC�QD�D�u�S�S�uA�(����'�6��q��^���T���B�f�M"��^fi�N��tJ����0<G��!�>f���*Y13�O�f]x�DZ�a]3�Z�n}��P$W�B.)~��kLhG79��,L�{.� �`��W���i,%*�)`�N�����	"�$$�J����J�r�X	�بG�^�0r<�'�wv�&1/8U��]�p���9I� 2zGI�s`�eMx��%��`jAå*�E�؂�7a�GЫ1�Nd8�3�WM-�77�a"���[�yUJ�q�zL��iB.�q���� ��[@%HPQ@��~9�0�0�=�^x�3o�*�&��f^[<D�^���݁�ԃ'ln^���.�9
X�5]���{�	e8f$�Z�����#GwK:("�+�Sd4��%Z�٘<M%�sZ����M}�@�+l�gbK4�V�b���ţX��͘˅���	#F�V`IвjCe0�NB�<�K	�^�&2I.X+�^�B�i�vLP�z�ӏne��o��rgDh���Q��t$)@�@.4[�G��iT3L�c��^� ��Y�,�H�֨�S1EPI*h��uHyq"���������`�(:!�::^�$���I 	b)UC�U�i�8�vK�>�̱�@��N�������q&��1F�A��ry���&V��H?'^zIXفr;��,
�6Ch'cd�s��f��k��s��F)��xF��:Pנ�e"<#u}Rx�.�*��Mx@�µ�MH�B��:Q�!�$Ґ�%쒛���jČ�E��N�f������7�!��;�&Æ����X{j�+R[��G.��Y
P�|ʩ@*S  3��q�Y�B���e��f�ֳ!?�5����\�ۙa7A2V��)ڟo�,U""�Is��s=%��[|�I�f�;ۚ��πĸ���D�b�
I"� f֭Pԇ5� P���P�/��"��7&�c ,F{�@�_VY�`�o�a�U5��̌�����n�	o!��df ##��p�-��8��k��^�X���p���<�Iz��i��=D�X=[����F���,���k�E�� �����o�{�����rE8P��m��