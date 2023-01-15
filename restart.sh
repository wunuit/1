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
BZh91AY&SY���_ �����������������������������������^�}0(�aݽ엽�y��{��}����z����_Vﵽ��g��=���z'����z��wg{�޹�}�ﯘ�BF�h�m��h���&a6�4сS�i��4ƣ�hɦOP	�0&��e?T�= ��4dhC1	�110�
�53S�i�馦 ��O2L�"b=(�6���i��51�h�����D��ʞ�"�44f������<�4#�6�<��OHd�{S�65	��SH!��L�`M6��d�y)�M��OD�L�=��'�O
zdɣL��mM����#M'�S�I�="z�����M24ɩ�2hze4�A��Si��1Sf�ʞ��S�OF�xSeOQ�ڧ��=I�!�5F���4���m=L���Rm�3j����=O)��S��=Lj~��?Q=L�ё�mG�=4���44=O)�hښLA4&M��	�M����FiL������Mꞑ�e2�jy�ǪcOR��yC�٪�ީ�@��Pd�=O�<ҟ�C��zS4��2e6�H$� i0)�O#S�M=)��*~��ިާ�?A�O�~D�4I��zi�#򞩣�I�?I�=)짔����D�S�G�M�x��7���z�G���=F�S��SS��������t0���@6�F|#D� ��b���뭰�\�M+nXς1����IAAk�pDS�<#{]����$r�A(j�8N"XQ�K��bº9f�k\ŭ�Q(Ц�71�[A�#jֳ˔�s`�5�����'4U�ȕ��	��I�����#�HD�ΰ�UJd� q
�ِJ�9��ש�Z$��P�ٵ/���M�	Y�ަ�!Zh�(�(8P(�N%s����%{Ql�d��F�m
��v2�ڶ���1sjZ���o��?j0l��ں��׹n&rn}�Lh�d4�l���)`]ЗtЊ�HH&K"�{#���p������n���YuLE܆�1�Sm@BC�;q#&�V  "�I� S�������O��KR��sq�� ` �sR��ɓx�N+B�?���E)���W_���^���uYľ��P{z�̕lp������	��,��,3��m���:\%��&Ը�b"�@F�2Þ%ݓzs�Q@|(�iIu�l��7~>��ҀT�W����k���a5��|��1�5
���i�Yn��Ugkyw�t�]����>��	U?�����X�!"ш@X4�
sHKh�̪JP���j�g�f�p�iI�p���� m"��t1I8b�GZԆƲ�{IJ�)l���t�(mo���h'0I��������N[V"�&���&`7e��e5N��哭-h�T(��T�L�Z��1Hg�9B%�6M��D��\,Y(��`'3�f�U��n�H�4�wz�&�~�s�2�f���ZU@(]�w�:����&����!��i$N�B6M$��u�*�<
[�F���VL�$��%��B��[�+�{���3����f����t<Y�
�u�
�,������=Y�RV�G����[��a28LLm�1 ��iX檼kJ��[D�ԥo�y�����T��>j��(Q��؎�'T�S۳t:� ��.�+�_��V]��h;F!N`.����k�g~Y�c?�cӟ��z�o�Jbx�Rnڠʇ�hPF��IEm��B��5}m�Nn�����+Dܓ>D/
�Ko�;�>��bm���Nͳm����r���i���+���E�D�wFG���[2����"V7s�VI����-���Y�k��7ʔ%�1��>�7	q�l��B�
,KFÈ����l���-՚�k:7�i`��a-[��GW�zdt����1��3���
�	JyF��4ڎ�]NO���9�#��\���{慶h5oص��Xt:|�.4���r>�J��hѳ��5�,��C46w�.S�g�q}
�+ȑ��
vT-�I�{FI=�$t�����I"�Q�8	�HD`N���0�*��]�����Eз��y�"%0����ѱ�@�̎k����s�DK����R���<��鬛���.�^�����ҝF�ɚ��z_�?)�U��,��gh���^�&�C��Lt|��_z��=$ϓ�A�;�3��Ձ����k�͞E�s�D�� �m8d�(�F�V��Z�w�,ksu��7}c�����Uo;.�&��Fn�8+����u�6Ndȝz��h�����紌9�N3A��1��i �
�xg8��,���YB��W�����N�Є���e��iR�sdk���ِy�,�>W�v�6��S���Ð�/��3��F��<�Q�N7wT|E�}8���Ҡ�g	 `ݩ�?�5E�pI����~������;�w����첼'��l0S��&�s!3�Z�	��C�'�|������܍�c�O��}�w���-͜��9�ITAܴ�}�'=s����g���?�g���xѶk�����9Nbk�H�������eQ�0.K����[�}�A�áFl���^�?� �OO�j���1&�?&��y�I�
��g�1��	H�+6:�u��V��Q��k�f�
����Jkle�Nʌ����'���hp��� Dpl���)����{�hF�'#��ȼ�v�5��ۿ�J���xN�VV�j0#Y�e#�D\`w�(	��9������h|Z����}x��g�.zΤ�ilk��J���{Cb6�I�S��3S��S=�7v�4O�+�|�%�li���ƨ��O�qb?�᭬��� �U:b�[y8�8	8l��]m�v�+�*��t]A�u�&���kZ �YE�"�|���PN��H��UH`}jj�Z�[5�HnF��j��{*�2�i�J$�@t��gl,�~�m��%��������2�&RC[{G!�F��O�A3�M��@�L~�WkH��I(�	�s� �.�LI[��q�?�|lJ�����8?"�����1����,�k{��g�9�҅�����������p��#�pz_���7���ua�~����.F����;�3R�4�9s�]$��&��p��[A0�o/�����9C�]\����*`W{�"Ko��{UI�[�z��q���-�G՝L�f(u����������8?B`��0��o.	n�Y�M-A/-�_���d|�%�����sS�����k�^����<_Z�i�fA1m��Ӳq�0���d$?�2�̨ �%$QTR_�E	�[�O�̖��r�+[��S/���	�JB�_}^rnޫ��CQu�wRU�/�o8�F9�EU�:�r�iɴ9]���rYߞ�C��Tz��r������x�l��u��wP4z���>��*
H��'gj�c�/,��鹅��@d�«��9�������-��*������t
��l4C�X˹]i8�AcF��e���CRuv�1W��.�ܹ�܌���fu�'}c��ϊ^�Q���s���go�U���͊J�a�K��ZY��?*`��o-ǫY�<�_��f��7KW/��d���# �.�%�
Mg�z�Շd㉓��� �P
�TFc=2I�@���J�7����|���`��{�Ag}����JF�X�S�!/o��B	�0�b���<�%!`V�F"�6R�t��H�JJ�4��n�Fau�K��/���������!�b�^���mn3��S��2�Q�>��B�S~^�|�Y�0��""-r��S�t��P��Q�8xF4��h]�,���U��nn�}m�3P��!*���NSNaYr�-�<�O�ܝ�|��l�Vy����d�8�+�Y��Vj������}l��x���]��������#�B"��0[X�z���;�e߻8۰����>��v~�w���h�j�F��n�C%۠ԋ+���OT�I�m�Տ������}Y�-�g�9g� ��s����hr�ǽ�Z�d{.'�������}	i�j����p�+T{/wuw0�H�#��Ex��Uv�g���l�Y�F�\���DE�C���q�0S�䤤!���B�� GR���|�� ή�W�gv :�� �������-S�Q��g8� H<<��gg�������V��dOH�a�]��)W�#�c��uQ����8�CO�$��4�!!��N=��VKy�*�C 7�a�!�QX�3����M�Ǵ� Y�<*گ�C�l��ʵގ�jAk\`g~�37�>N�x�tX���0����:��4\���@��}#'��`r2aQ�(�@¤3%�sJ��*IЗ�k�	�2S(���%&qk����7����Z����*uҟ,�}I��%Ǘ{C!���s*P�b����h�(T�y�.S��2�Ђ�59�o|I����qk�F��|�U���ԁ�7f�(�w#����6Y����3��n�U����;^����oq��������ZW�f,�j�)�y'��Ixe�*g,=��j&���'o�N)���5e�O#� 7�:wö��/���]q����4y1��$dP/I���s��0�>*�h')��(����`��r���0}{���z��dq�sP��t'{BY�0կ�Ƀ��Y�B�D���7�۟����9\��{JJ�Xe񭄄=��W�(V#�@k�dN�O� "촾Jc�$�3"������4��V���E�a�V�UA�	��v���"�����z�#B j����7uw�q���CI_��������%e�"����r����<�w9�{]����	��?�M�;�_� h�V�� �D1A�ZDѶ��v���UC'*�%.+��/��*���r���[�k_	4T�W���5�.��/?ݭ����1���ݿ��yب!�*Ԝ���mN�,��0�@��>�leM�T����%�h���"j��a��[k��}%'������wvz�OS���������|Кr����X�����x[L��& ��ϧJ���	�K�۝P��0������f�q6����l
C�ʇ�p�)@/��7��mՖ���Z~|��ݰ<\���X��aΐ�=%����C�iB4!fر=~�u=��Hr��>xg�Sy�3�'�ἂ��o�j)Z-�(���p���"� �g�r)����D���qZYa7������|�����w���1]W��v��>	ʹ՗g���j�g�'�������e��#�d
��@j�V�2-u��p�vW[�+��y���+1`�N*ݞ���6�^��[Uf�w]������;k�������k��(��6��{���k3�[k1"qZ*"��8���6{��6{�����)��t�z�nE��,�Fr�Q�� ����-c�<�!��:�)�uf܊u!a��r�CӹD�2�U�D5�G�N+[�AA,F��9��BY�v��A�G�i���W=�$�u���?b�RR�&/��Cb7cm\�6|���p���1��Z����������w���Y����]�`�h�;`�̠�J����߻��Ț���"��T�%�jZV�fE��<���T�>.Wɉh��)~�9�}&����}J�k�\<��n:�������e�:s�.:����c�е<o1o6,��J맭1xQ�oe�z	v�D������ī�4tƬ��>M��c���>)4���X��0�D�%�~���*�WIy>���^ֺ��յ\���qΈ5����~�]�J)
z5��T��r�_T��uf`��u�
��'X�<����3�f��q��氀TJ�y�߆m5Nµ����4�����G��]�ȓ!G��#K/9L{�H'��(�z��s��\al[՛���c~v �
�O��B@e@�FX*�Y���\�'M��ʠ֥4�M�;�E���f��^L�"�2���w:�T	���Gs��$oh]�Y�8���1��ga��` ؄�@	��.��ؿk�/�W�1a K�n��>bkN�������eyl�Ё���4@L���u�k�,����b�|��x�l�8������5;z�p���� ��
&��r?a�=�=qE���;BK�?�%/;@�O�����jBi�+��_V��+���w��������-΋�auZ/�+���E�v�����Saf\���� �S��Q��ߦ�Z
��Q�h���q��d���Y�����FD���},|gfXLW�m�F����*R��=����za��1��D��B!�@���\�Z�ko���ц �������"Z%���\,Z���P��7^�t�䰙�f��
U_����H�|�9��2m���4<m>�q�,y:oӻ�LVI��Թ���E�v�gczu�� �5Mb�w�ĐVY�r��{1xx�$G����������d�+�a�e���3	� � 0�B_s<(�MWg:�|��Xv}���1���8�Q��>�LԂ9(��u�^��c��TD��a�*d��/�[߲�Mu2�7�m�Y����^�����v ��+���Ϫ�؀ ��$�/���CW�rj�R���9�pHn0�v'WP���q�-��-N�N�o�	쭑o�,��&�_C';m�#��Vz\�c�)�U�5����5_�i�p6�L��4(�WGxjh>70�0�A.r"�����;����Q*2ۍ�J(^�#���������s�W��=ϠI^��\��'K�3�:J� ��b	й���z�!�[���g�q��2�q��8�S�Q�a6$�zϙ������_���)}ʾGx�Q:��J��i����������JI8���"�W�~�/m�u���;����l#�Yv�QJ�
I!4�� O�fA�V��@�W]��/��&����m<5sa��*�#(��2�T)%�Y7t�\�eއn��K�o^z�DM�7��?)��6�uSzǈ������{�.Q=�U�s>ϫ�K���A�"�.��2j�����ݭ��,������.򣻊l��y�ſs��j��}̏wa�n��ZlȀ�ۨExԒB���>�2|nT����/_�G*|�L����fw�X�ǚ�>V�+���gQ�´�1tw;����w��*�+]^�^k��ҟ�k^�J���gY�c�����\o�B���I;3ͤ���N��V�!S�w0��z38Vx"���FBz�̽v5@J�?���Ms���}�h S�D Bk����n8�yf>:D�P"#Y�R1i�t�f�O`��;�:Ո������bs�`f��E��E�}�V���l�������.oa�T�қ�z��� �~5��x.�@��Oq杷��52J���W�`�����"z�I�&�E�2�p�5pbtC4���&V��p��C���6�  $�Q@ 0��Q'�{��F/��rR�?C��6�7��F���������R{K���z�����f�l�p���kDT��;��r�]G��4����^a;�(9 f?���\�3*b�|0B��9��� G�8!e�k(��w��a�̈H�!���yN��"�]����L���0��oT��ؠ�hS���ui�  c�ƥ`,䆑�.V�h���}t+X7���Т�ٷ'v��s��;`o�1Jy#��,�GV,�	  ��jCM��3�fn��7�Tܪ�����Τ,oO�4@�M޿�c
�ޥ_��;�d��1龄~���ٹ��,�T������β��V�\�H���?��)��`�}�)֎'~������Mo��Sٟ���y/6��,8��P��Yt�΂_�Bv�*�s� M�ȟ��ã��8�g��*�S|�q��G��f$0���?ZS�O-^����{/����Z��,GA��*���Ѯ����9���S*92ۥT����h ��vՍ���UY���i����H׭�f������SNA�:Bw�a�jz�����B����m��j����K�GSA��� �(O��]��kg�諸�����r���˛U #�^�V��&��'��Ru�X�c&�`Z��2��T9_
�b�^�+�����+��9~�KZ|M���dHY�RY2�t��2����Z>������A�U�W���YBN+w[C��h��1g�j��-!Y�[���jSiڐ����,�y�^�t�F vG�vn�]�8$�~Q�LQ+�[�w-2��Ǡ�#kI��(���_-���R���%,nR+��0y���{����Mr`�O(����ɔş[�PdrFEh��HKB��_|�l����Eſs��X׎)fԋr���Ҷ���W,�!���P���}VZF����Ґ�4e�r����ޡ�&�u�%�ч;Ǒ��V���G��|�Ri�T�a��'��(��-bS]S7߿�^�r�i
���v1��ߝR���0�����5��O��q�˭���n�7����fgIYN��1�PW�����u�5��(F�u�Σ�>̈���k���g�D|'�>�ǽ�K�֭R"�ѥǔhY$�fv����0�vI��/ܷo4�S,��s���`" ���x��=�=��=��|�݌C�h��K�8���ґ�y������XvXR���;�5�u������sH�sHD3������pv���%:HC�С����ݏ#��jqz�W���'�~.������f��ד�{֤}I�g�E�jF�,9^�n6�mi::2ə���+Q>��w]Ή�}7m���n�2�G�A���U�������g��%R?���o:�GIL!��m���*T�����aH�%��)Kb��~��hJ�ùy'���?ٝ͟0�N�-3ל��>���J���4 � ���������z��K�2�-�0@A���w%����)�N~� s��rJ����@�P�=��Ga�nC;�c#x�F�Jw���-I�Z���u�˝/˰���o�K��}�M�S����&���-�A���+͌2�Q�ٟ�c��+��f:�ǫ��D�+)F�>��x��LJY�*D *�[��ڲxu��^j�Y��c����q$��Z�h�Z-�$k�G�!ʰ�ռ�7	^�᷅��gmd�Xʓ�p޴V ��D�yÚ&e�y6C �j)���x�@��r�?�9�a<�L6% �BpJ� Y��rA ��JMEȎb�6 �U6D��Z�&�k}��2��liӧM�s��ֽhAQ �=8�̽���"�(H_��/�