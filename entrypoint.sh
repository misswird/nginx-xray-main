#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�A	�dentrypoint2.sh eW	TS�־IB� E�K�̙
�$��@��9d2`1JhBL��AmŊ�gU bqj�Vm�gE������:q�M�����Zg�����;���ܳ���L��@ 	� ��� 0�� ¶��oo�G�x���{o�Lp���=/�`�VV�<gLI��<����X�%8��Q)��"�'���*!F���@<�&+_+������,����,��&�����Y��]∡�RU��'-��J�&ae�y;C���T�Tʕ$��K�q5��#�FN7�5�k�@�h}ۄ�mt�Ʊ�����}zf��i�o��C�{��L�=[G[��-�B��TI�6�ԀDQ�*��4'+q�4%3'W���� �
�}.��$TK˞���U2h��2J)���=�;��J����N��2
GAV���Y�h���~Ln$ܕV�#|�k��y�R����U��C��m����U�|]o��,\C��I�]{�o/�Lf�$f$'e����QpL�-y���`�|z쇙�iip(�2+��ڋ���c���Sa������JM^�ѨE�qE���h�10����=��෿�Y�AiEL�Tt��\�1`2��LT
���=�Gw���;j1O�:8����]u��wq+�P}��|3v��yv{����*�,fS}�ؐǅC#�+��y~g��TDベ!h��{����=&РV���d��sM9�#�NAr)��ⰕR�\@�˕�� 7"�t$��fg�.�e�!PVF$TKخ��QW���u<�_�����+iə鉩I�_>��&�~Ny�h���]�#g[2�+��d���2e��Q�gDC�b$�3-	��Ʒ��+6v�ė}��H,7���4���:��ɆdVbi�R^�B����w[d�<�ߊ�Ʉe�H�����DV��2"��4���G�=��S�P|h��]�P�'z��[���l�ؓ��T;�����nLsU����ڭ�����hHw޹i9���R��;� ���޹�g!T4RB�ԯ�©Ќt��]D�Ok�_�}+�%s�%q�.j%�c��X�Ul��b�w1ick�Ot�B��	V_����KLƢ��a:�n��G����#k|�h��3�]ڹ�T�$�z��p��T�'�t�y��<��M�˫}xtzj�
z�[����+|_m�ߊM��Z7B�����kr3W�`�0�������"2)��Z��N�fK$��M����{�U$����,�HZ��L�.�Y��9���;�q٦�/�tYG#�4��r%9J���!~j�����O,FWLI�Eŕ$̣xh1ȃ[����I��G�_�p�͊7ܹr�0,�x}jr\qX���˰����T����mx�l77�uzYiX�1��W�w��Q�_������E��.�ɍ�Nbs��v���Dl��,��L&_$�羓���%rΎG$ۄq!�Jþ�S�2� miu�&=����E�5U��݇PI�F��ES��ڣ���3���@�D�~(iyR�0k3 �y|zG`ۨ�2sc�� ��d-�2�:�\��z0Z'�T~3;oZw��ŏ�Z�,�^Q�t���^J�2ㆻuѳ@r�С.����þ��0�%l͟�h�nbm�'a�2b��J�3�c����$�����J<x_��D�n�˟�'��/qG:��ԏug�d����C��<yj�e���l �㞯�]�Z���W-�yҝ����r>qh��=�z���xk���}c�v���Ϩ�)R�s�3���Z���{�}'Y�HdܮWd�TWd+ �C���q �f!�j��JF�6��\z�[��3��$����A��7���Aν��($�U��l��_Ł^<���(+J����Gƿ��P��|p�@ɓzt}|Г�F\��Z�Z���/�ǂ�<T	��()ޅ��r�>��t�_;v�4j�P��9d;o����2U>n?����֦��[�
�?v�m��xp��y��׈�͸���_E�!�(�XcǨ�}���o!=�- !���G�9�vZN�D��A��R�O��ک�����'t.Ѝ��QVe�j��ū3�oqT3|i�00K.�e��K�,� 㓖�I�AL��|��]������%݊9��8H���%Oyd����5�W^~$8��+�8'2xEz��?%<u��)�Y�4+-��w�8��Lݢ�}��/r�׊�E{}�t�F
خ��vh[����n���|3�nП[�3SX��9��<� �|s�RL]r�Ԁ޿*3�c�5�h%�VQhcى-)~�D����s)3�SL�J��)��t3�"�\�-��<��g�q����=p��\p �\�V������h�'F!�]$��T�lWq�^��@ɖ�%	tRi'��s�_�Rs�u�lY�*��ǿ�kΌ|iu�Z5OO�(g�8�e]��*e/���;�|q0QK&��!E�[#y�6ـ�_�*i�&rn[�9����L��:�.ѽ��D��jʿ�-� ��oo�Mlo�����N���X���\�>�|�f]��Qab�bI��e[0�S:o �wp2d�m8�+&5!̴�@�� =��X,.�\�#�4��y�'oqC��ǧ�y����C����T���ކRz�����iH]i������Kр����_`�~�����7f_����'�ʏ�I��R5/'V��	��:]��N�	��g��&R죹�0T.!*�jD��d0����_1��0 !UƗǁ�B�
�Ï;�
6����Dj!���@8J ���Q�r��aV�B�Z�1E5I�'�xj�`���9�$
\&W�U�B5�,����i�ߠ�<��&J$`��Kf�T<e%�K�c��ړ��Csn���f��x-���d�m|䘋	h�j�.�/��h�u���%s*Qz[��/q�e��os6Z�]`G��P��~����T�;Ó����{a�A�-�B)d��!��6�Y��%�l���ޜ�4��\�q�v�{�AT v.��6��z;&��m/����%�L�X�K�k=�-�WbX��<1R���(C?0��l�z��>l���3Lo2�;�j�#�P$F�ߏgL%��.v������8]����88��'י�#&��I�52�8p@/Ecu�{c�`=�;��Z�d^��9�G�V���Y���i�T�� ������Ff�8�1�����L��A'�+�ys�@�#,�Ug+�g8���sF����G��u[?P�]M,�����q,��7� �v1B�ʆC�6�Q<0AF��ss�ab�Ār��bNL[`��Q(�Ah�ڲl��9昵'`�0uS�	;���0q��K���h�z�P���^�*^̚�ʏ��Z`f�A�3Y�Ɛ��Ko�X{���}�E&�Xf���m�`��&�	S�&Pd��<�D#X�p����h��X	����=�� a�G�&Ҁf�@�m%��������6�_�~��AfL8��#�-��V�K�vl��_��kt2^�:n�)4�7qB�%�����f/��;K/4�|�]ߧv��oT�D9t�ҍ���c���>Ի������H��  