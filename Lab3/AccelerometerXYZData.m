close all;
clear all;

yneg = [-980
-986
-984
-988
-984
-991
-986
-988
-987
-985
-989
-984
-993
-984
-990
-988
-986
-990
-989
-992
-985
-990
-987
-989
-986
-989
-985
-985
-985
-986
-991
-991
-986
-984
-979
-987
-987
-984
-982
-987
-988
-988
-991
-982
-990
-984
-990
-992
-983
-987
-983
-986
-983
-987
-989
-984
-986
-989
-983
-985
-988
-985
-988
-991
-989
-990
-983
-989
-982
-989
-984
-991
-992
-981
-986
-987
-992
-986
-981
-985
-989
-986
-988
-981
-989
-987
-979
-988
-986
-988
-985
-984
-982
-985
-986
-987
-986
-984
-987
-983
-981
-991
-985
-983
-989
-984
-986
-985
-992
-983
-992
-986
-988
-992
-987
-988
-986
-989
-983
-990
-987
-983
-984
-984
-984
-989
-989
-988
-992
-985
-989
-985
-987
-982
-987
-986
-982
-986
-992
-985
-985
-983
-988
-989
-985
-989
-992
-985
-983
-991
-986
-990
-981
-987
-985
-989
-986
-993
-992
-988
-987
-988
-982
-985
-991
-991
-989
-988
-988
-985
-984
-986
-984
-990
-989
-989
-985
-991
-984
-986
-989
-990
-992
-989
-987
-986
-988
-981
-986
-991
-986
-987
-988
-989
-989
-985
-985
-990
-987
-985
-984
-981
-985
-989
-987
-983
-990
-987
-978
-986
-985
-978
-980
-987
-986
-985
-989
-989
-987
-984
-990
-991
-987
-981
-986
-991
-980
-986
-987
-985
-984
-987
-990
-985
-981
-986
-985
-989
-986
-987
-984
-983
-992
-982
-984
-986
-984
-986
-989
-987
-991
-984
-987
-987
-983
-984
-990
-985
-985
-983
-982
-986
-986
-993
-993
-982
-986
-987
-985
-986
-987
-990
-989
-990
-984
-992
-987
-985
-986
-987
-987
-979
-988
-996
-986
-981
-983
-982
-988
-990
-988
-986
-994
-984
-989
-989
-994
-988
-988
-989
-980
-985
-987
-981
-985
-991
-982
-988
-992
-989
-986
-985
-991
-986
-986
-983
-987
-989
-986
-985
-983
-984
-984
-993
-985
-983
-991
-983
-984
-987
-983
-986
-982
-992
-988
-982
-988
-983
-989
-992
-987
-985
-990
-986
-986
-986
-988
-984
-988
-984
-988
-989
-990
-986
-982
-984
-988
-990
-987
-987
-986
-990
-983
-987
-983
-986
-989
-990
-985
-986
-989
-989
-988
-984
-989
-984
-988
-983
-983
-988
-988
-984
-984
-990
-987
-988
-989
-983
-983
-985
-986
-988
-989
-988
-988
-989
-981
-986
-987
-979
-989
-993
-990
-982
-988
-988
-989
-982
-986
-987
-987
-992
-983
-989
-990
-988
-988
-992
-989
-983
-985
-986
-989
-987
-984
-986
-985
-974
-993
-988
-988
-983
-982
-985
-986
-989
-984
-989
-991
-986
-981
-991
-982
-990
-986
-987
-995
-983
-988
-991
-981
-986
-992
-982
-987
-983
-984
-990
-989
-983
-989
-988
-989
-981
-986
-983
-983
-989
-985
-982
-987
-987
-987
-987
-989
-981
-988
-985
-981
-988
-986
-982
-990
-987
-985
-984
-983
-984
-985
-987
-982
-981
-991
-989
-991
-984
-984
-988
-985
-986];

ypos = [1003
1004
1008
1007
1006
1002
1006
1007
1003
1005
1001
1004
1008
1007
996
1003
1007
1005
1000
999
1004
1000
1002
1004
1008
1007
1009
995
998
999
1007
1004
1003
1002
1001
1002
1004
1005
1004
1002
998
1007
1006
1009
1007
1003
997
1007
1007
1008
1000
999
1001
1006
1008
999
999
1004
1007
1003
1006
1002
998
1000
1005
1000
1001
1013
1007
1002
1000
1003
1007
1004
1005
1006
1008
1000
1004
1000
1003
1002
1005
999
1004
1005
1006
1002
1002
1004
1004
1004
1003
1002
998
1008
1003
1002
1003
1001
1004
1002
1010
1001
1005
1009
1004
1004
1005
992
1004
993
1001
1004
1004
1003
1001
1004
1000
1006
1003
1005
1002
1002
1002
1008
1000
1001
1001
1003
1003
1004
1009
1002
1006
1001
1008
1004
1009
1004
1002
1007
1000
1006
998
998
1001
994
999
1000
1004
1006
997
1006
1003
1003
998
1002
1002
997
1005
1002
1007
1004
997
1005
1008
1004
1003
1006
1000
1006
1006
1007
1000
998
1000
1009
1010
1001
1005
1001
995
1000
1006
1001
997
1003
1004
1006
1003
1002
1000
1005
1003
1008
1000
1005
1004
1006
1004
1003
1000
999
1004
1003
1003
1005
1006
1004
1003
1005
1003
1004
1003
1010
1008
1003
1002
1006
1006
1002
1002
1006
1003
1007
1005
1001
1004
1004
1005
1002
1006
1001
1000
1004
1002
1009
1008
1001
996
1003
1001
1011
1009
1002
1003
1000
1005
1008
1002
1003
1008
1004
1004
997
1002
1002
1004
1009
1005
1005
1002
1003
1003
999
1009
1002
1004
1006
1002
1004
998
1005
1001
1002
1001
1004
1005
1001
1007
1007
1004
1001
1018
997
1004
1002
1001
1003
997
1001
1005
1001
1006
1008
1008
1004
1001
1005
1009
1004
1006
1002
1001
1007
1005
1005
1003
1008
1004
1010
1003
1006
1005
1002
999
1000
1003
1001
1000
999
1003
1000
1003
1000
1006
1002
1003
1007
999
1000
1001
1000
1007
1008
1003
1002
1006
1005
999
1004
1004
999
1009
1002
1002
1004
1005
1003
1007
1003
1006
1005
1007
1004
998
1002
1003
996
1006
1003
1000
1001
999
998
1004
999
1003
1003
1008
1003
1003
1004
1006
1001
1002
1000
1010
1001
1001
1009
1003
1006
1000
1004
1004
1007
1004
1002
1000
1006
1009
1004
1007
1007
1005
1002
1003
1007
1011
1003
1000
996
997
1007
997
1010
1000
1000
1003
1002
997
1002
1001
1003
1003
1006
1003
1001
999
1009
1006
1004
1006
1001
1004
1002
1003
1006
1005
996
1002
1002
1000
1006
1003
1004
1002
1005
1006
1006
1005
998
1000
1006
996
1001
1009
1001
1004
1004
999
1009
1003
1003
1005
1007
1000
1004
1002
1005
1000
1000
1006
1004
1005
1002
1009
1006
997
996
997
1008
998
997
996
1003
1005
1008
1007
1003
1004
1005
1003
1004
1005
1001
998
1003
1009
1001
1008
1004
1002
1000
1000
1001
1000
1009];

xneg = [-1028
-1020
-1028
-1020
-1023
-1022
-1024
-1021
-1022
-1027
-1030
-1026
-1027
-1022
-1029
-1027
-1026
-1025
-1025
-1026
-1023
-1025
-1026
-1025
-1026
-1027
-1029
-1025
-1018
-1019
-1027
-1027
-1022
-1023
-1027
-1023
-1025
-1020
-1020
-1020
-1026
-1027
-1030
-1022
-1025
-1024
-1027
-1026
-1023
-1023
-1023
-1018
-1022
-1022
-1021
-1020
-1026
-1028
-1025
-1026
-1026
-1026
-1022
-1017
-1020
-1017
-1024
-1020
-1026
-1025
-1025
-1024
-1030
-1026
-1022
-1028
-1027
-1025
-1022
-1026
-1021
-1031
-1017
-1024
-1021
-1027
-1024
-1025
-1025
-1027
-1025
-1024
-1023
-1023
-1021
-1028
-1021
-1025
-1025
-1024
-1021
-1023
-1025
-1024
-1026
-1023
-1024
-1024
-1030
-1023
-1022
-1028
-1027
-1024
-1027
-1025
-1024
-1025
-1029
-1023
-1022
-1024
-1023
-1027
-1022
-1021
-1017
-1023
-1025
-1022
-1027
-1027
-1026
-1023
-1026
-1027
-1024
-1027
-1023
-1026
-1026
-1029
-1023
-1026
-1026
-1019
-1023
-1025
-1032
-1027
-1030
-1026
-1024
-1023
-1024
-1025
-1030
-1023
-1027
-1020
-1023
-1022
-1025
-1028
-1023
-1023
-1027
-1025
-1027
-1027
-1026
-1022
-1025
-1022
-1025
-1023
-1024
-1027
-1023
-1027
-1026
-1025
-1020
-1022
-1021
-1026
-1029
-1022
-1019
-1031
-1027
-1025
-1021
-1025
-1025
-1027
-1026
-1025
-1028
-1026
-1027
-1028
-1026
-1023
-1024
-1021
-1020
-1027
-1021
-1025
-1022
-1022
-1026
-1025
-1026
-1026
-1025
-1025
-1034
-1018
-1031
-1025
-1021
-1020
-1024
-1016
-1029
-1022
-1025
-1032
-1029
-1030
-1026
-1030
-1029
-1027
-1025
-1023
-1029
-1029
-1025
-1021
-1029
-1023
-1021
-1027
-1026
-1025
-1031
-1027
-1025
-1024
-1028
-1026
-1025
-1027
-1029
-1023
-1023
-1025
-1020
-1020
-1025
-1028
-1027
-1024
-1021
-1029
-1023
-1027
-1028
-1032
-1022
-1020
-1028
-1020
-1027
-1024
-1018
-1025
-1024
-1026
-1028
-1028
-1021
-1021
-1024
-1021
-1027
-1025
-1022
-1031
-1028
-1025
-1027
-1025
-1021
-1026
-1031
-1020
-1026
-1033
-1028
-1027
-1025
-1026
-1020
-1025
-1014
-1033
-1031
-1027
-1028
-1028
-1020
-1023
-1025
-1026
-1025
-1025
-1032
-1024
-1029
-1027
-1024
-1026
-1030
-1025
-1026
-1022
-1028
-1027
-1025
-1022
-1027
-1026
-1032
-1029
-1023
-1028
-1027
-1025
-1031
-1027
-1031
-1028
-1019
-1026
-1031
-1027
-1025
-1026
-1026
-1028
-1028
-1031
-1019
-1029
-1025
-1023
-1031
-1024
-1021
-1028
-1027
-1024
-1023
-1027
-1029
-1026
-1025
-1029
-1025
-1025
-1035
-1029
-1026
-1020
-1027
-1033
-1025
-1020
-1024
-1025
-1024
-1028
-1027
-1023
-1030
-1020
-1024
-1024
-1027
-1029
-1023
-1022
-1019
-1028
-1022
-1025
-1027
-1029
-1025
-1021
-1025
-1023
-1021
-1023
-1028
-1026
-1026
-1028
-1027
-1030
-1028
-1026
-1022
-1031
-1027
-1025
-1021
-1028
-1026
-1030
-1022
-1023
-1023
-1027
-1026
-1021
-1025
-1027
-1029
-1025
-1022
-1023
-1022
-1031
-1028
-1028
-1033
-1030
-1027
-1028
-1022
-1026
-1023
-1020
-1027
-1027
-1030
-1023
-1027
-1030
-1019
-1026
-1029
-1028
-1027
-1027
-1030
-1026
-1025
-1021
-1022
-1019
-1026
-1025
-1024
-1024
-1027
-1027
-1023
-1029
-1025
-1028
-1023
-1025
-1023
-1033
-1029
-1024
-1024
-1028
-1019
-1024
-1028
-1024
-1026
-1022
-1026
-1024
-1024
-1027
-1024
-1026
-1022
-1027
-1030
-1031];

xpos = [987
987
989
985
987
985
981
984
984
992
981
984
982
982
982
989
985
982
981
985
990
982
989
986
985
984
984
988
981
984
988
985
982
989
982
985
986
980
988
983
984
986
985
982
983
983
986
984
986
985
984
989
989
983
984
990
977
980
984
988
982
984
987
983
984
981
982
986
985
984
985
987
985
981
981
982
984
988
987
982
982
982
985
983
985
988
984
989
990
979
986
983
988
984
984
990
989
987
982
983
987
983
982
983
988
983
986
985
986
983
987
992
988
983
989
989
988
987
983
983
983
980
983
984
984
986
984
986
986
982
983
985
987
984
985
984
991
986
983
984
980
981
981
979
983
982
987
982
987
985
987
985
980
985
981
989
982
987
986
987
978
985
987
982
991
984
978
980
989
987
984
985
986
986
983
984
989
980
985
984
986
986
983
982
982
980
981
985
986
984
988
985
983
983
986
986
989
987
981
990
983
986
983
986
984
982
985
983
988
985
984
988
982
985
984
981
987
984
987
987
987
980
984
986
983
984
981
984
985
985
986
985
988
980
984
983
983
984
980
985
985
986
983
983
983
979
985
984
985
985
986
983
985
984
988
987
989
983
988
983
985
984
983
985
981
986
982
985
985
986
983
988
984
985
989
989
981
985
982
980
982
986
986
983
991
986
988
983
982
990
985
981
981
983
987
986
977
983
987
984
989
982
983
982
981
984
988
987
981
980
986
990
982
982
983
988
984
979
984
985
989
980
983
985
985
986
984
985
984
980
989
981
983
982
981
982
982
989
987
982
986
988
989
985
986
986
992
982
983
987
987
981
987
986
980
985
984
984
989
985
983
985
982
982
986
987
985
982
978
987
982
980
988
985
982
987
980
985
982
982
988
980
985
987
983
985
982
985
985
984
986
990
987
983
985
985
986
984
988
985
989
981
980
981
990
984
983
983
984
982
987
979
987
981
985
987
984
987
985
988
981
987
989
982
983
983
983
984
986
976
986
989
986
988
986
982
985
985
986
984
981
982
982
986
988
985
981
981
993
985
982
986
988
983
986
985
987
986
984
987
984
984
986
982
989
988
982
985
980
982
989
985
981
985
990
983
983
987
989
980
983
983
986
984
987
990
984
982
982
990
984
979
980
985
987
986
987
985
985
990];





zAccelUp = [984
992
993
985
991
986
996
988
993
986
988
990
983
985
988
990
989
990
983
989
990
991
985
987
988
994
986
988
985
978
986
990
990
984
989
994
988
987
992
988
989
987
985
978
988
987
989
986
989
990
984
984
989
990
985
984
988
982
992
992
986
985
986
989
991
984
992
992
992
989
987
982
984
993
990
981
978
990
987
988
985
981
989
991
985
991
980
993
986
991
994
981
992
983
984
984
993
986
990
987
994
980
984
989
987
993
988
989
989
988
988
992
985
987
994
989
985
982
992
989
990
983
984
994
985
986
989
983
990
989
981
989
985
988
980
984
985
990
992
981
990
983
988
991
987
990
994
985
992
992
982
986
982
988
991
989
992
992
984
983
985
986
990
987
982
989
991
989
984
985
987
985
992
986
980
993
987
989
988
991
993
991
989
982
993
988
991
982
989
988
981
985
987
989
994
992
986
990
988
989
989
982
987
989
983
989
996
988
993
983
987
979
990
987
982
986
995
984
990
989
986
984
986
989
986
990
989
985
989
989
991
986
987
987
985
984
985
982
990
993
985
988
990
987
995
990
987
984
991
989
988
986
987
992
986
991
983
982
993
977
991
987
996
988
994
983
976
995
986
986
981
989
989
986
986
989
986
987
988
992
987
994
989
985
994
993
984
988
989
988
988
992
992
992
991
986
987
988
992
984
991
991
989
983
990
991
995
983
985
987
987
988
988
990
988
990
996
991
991
992
987
984
994
989
994
984
991
986
992
987
986
982
982
989
986
990
987
985
991
990
989
986
986
991
989
986
995
986
990
984
985
983
975
988
979
994
990
988
995
992
989
987
991
987
990
991
986
983
989
983
986
991
985
989
984
990
994
986
994
990
992
998
985
991
992
991
994
984
985
979
993
989
988
984
993
984
990
986
992
988
989
987
991
990
995
990
991
984
981
989
989
982
987
986
985
985
990
984
994
987
987
993
987
989
989
984
991
989
988
991
991
988
985
986
989
985
986
988
991
979
986
992
990
983
985
989
985
991
984
979
999
987
987
988
991
981
998
980
986
993
992
989
995
989
984
989
988
984
988
990
989
989
988
989
994
990
987
988
994
990
994
987
988
988
987
989
986
986
992
992
995
987
989
992
988
981
987
989
985
984];

zAccelDwn = [-1017
-1007
-1014
-1010
-1007
-1012
-1008
-1019
-1016
-1014
-1008
-1011
-1011
-1005
-1010
-1008
-1014
-1011
-1009
-1011
-1010
-1014
-1005
-1010
-1013
-1012
-1009
-1015
-1014
-1013
-1010
-1013
-1009
-1018
-1007
-1008
-1008
-1010
-1011
-1007
-1016
-1010
-1015
-1014
-1015
-1019
-1007
-1013
-1016
-1012
-1009
-1007
-1010
-1007
-1012
-1008
-1011
-1015
-1009
-1012
-1007
-1009
-1010
-1015
-1013
-1004
-1010
-1007
-1010
-1011
-1010
-1009
-1004
-1013
-1018
-1010
-1008
-1011
-1007
-1008
-1011
-1007
-1018
-1004
-1007
-1010
-1010
-1009
-1017
-1010
-1009
-1009
-1010
-1006
-1013
-1011
-1014
-1011
-1016
-1012
-1008
-1013
-1012
-1005
-1007
-1013
-1013
-1012
-1016
-1012
-1010
-1010
-1008
-1011
-1013
-1005
-1010
-1009
-1007
-1010
-1007
-1016
-1010
-1013
-1006
-1006
-1011
-1012
-1013
-1010
-1010
-1015
-1010
-1019
-1011
-1009
-1010
-1009
-1008
-1013
-1008
-1010
-1017
-1013
-1015
-1012
-1003
-1009
-1009
-1009
-1013
-1010
-1015
-1007
-1011
-1010
-1010
-1005
-1010
-1014
-1013
-1006
-1008
-1008
-1008
-1006
-1010
-1004
-1013
-1013
-1015
-1008
-1011
-1006
-1012
-1008
-1012
-1015
-1017
-1011
-1006
-1009
-1007
-1010
-1006
-1007
-1006
-1011
-1011
-1006
-1007
-1009
-1013
-1008
-1010
-1019
-1006
-1010
-1017
-1008
-1010
-1010
-1018
-1010
-1007
-1014
-1012
-1013
-1010
-1010
-1020
-1005
-1011
-1009
-1008
-1010
-1012
-1010
-1009
-1015
-1006
-1013
-1015
-1004
-1013
-1011
-1013
-1004
-1009
-1008
-1009
-1012
-1009
-1017
-1006
-1014
-1010
-1013
-1015
-1012
-1011
-1010
-1017
-1008
-1006
-1011
-1005
-1011
-1011
-1013
-1010
-1011
-1009
-1012
-1010
-1010
-1010
-1007
-1010
-1006
-1012
-1013
-1010
-1010
-1005
-1015
-1004
-1008
-1011
-1009
-1012
-1012
-1012
-1008
-1013
-1008
-1007
-1009
-1005
-1009
-1009
-1008
-1010
-1010
-1014
-1010
-1014
-1014
-1007
-1010
-1013
-1008
-1013
-1008
-1010
-1012
-1009
-1008
-1014
-1009
-1010
-1013
-1003
-1011
-1009
-1010
-1010
-1003
-1011
-1010
-1009
-1012
-1012
-1014
-1012
-1005
-1006
-1014
-1009
-1012
-1010
-1007
-1015
-1008
-1009
-1016
-1015
-1008
-1006
-1006
-1015
-1014
-1009
-1009
-1010
-1007
-1006
-1013
-1019
-1009
-1008
-1010
-1010
-1011
-1010
-1006
-1011
-1009
-1007
-1007
-1015
-1007
-1015
-1011
-1011
-1013
-1012
-1011
-1014
-1003
-1011
-1010
-1012
-1007
-1009
-1006
-1011
-1001
-1008
-1013
-1009
-1008
-1009
-1011
-1013
-1008
-1008
-1006
-1009
-1013
-1012
-1007
-1000
-1011
-1011
-1013
-1017
-1011
-1009
-1013
-1014
-1010
-1012
-1015
-1014
-1010
-1012
-1012
-1009
-1013
-1016
-1009
-1006
-1019
-1012
-1007
-1016
-1010
-1006
-1011
-1006
-1016
-1009
-1007
-1006
-1013
-1010
-1015
-1012
-1011
-1018
-1004
-1010
-1010
-1012
-1016
-1007
-1009
-1013
-1012
-1008
-1009
-1010
-1010
-1013
-1006
-1008
-1011
-1012
-1011
-1011
-1012
-1005
-1019
-1007
-1010
-1014
-1011
-1011
-1010
-1010
-1013
-1011
-1013
-1009
-1011
-1012
-1015
-1010
-1014
-1013
-1011
-1010
-1014
-1006
-1013
-1015
-1012
-1009
-1004
-1018
-1010
-1009
-1016
-1005
-1010
-1012
-1013
-1010
-1008
-1013
-1012
-1012
-1017
-1015
-1011
-1014
-1003
-1005
-1013
-1011
-1008
-1014
-1016
-1010
-1015
-1007
-1003
-1011
-1009];

Gravity = 16384;

% Calculate the Accelerometer scale factor and null shift in X-direction
AveXPos = mean(xpos, 'all'); 
AveXNeg = mean(xneg, 'all');
AccelNullShiftX = (AveXPos + AveXNeg) / 2;
XnegShift = AveXNeg - AccelNullShiftX;
XposShift = AveXPos - AccelNullShiftX;
SFX = Gravity / XposShift;
xNegCorrect = XnegShift * SFX;
xPosCorrect = XposShift * SFX;
AccelNegCorrectX = (xneg - AccelNullShiftX) * SFX;
AccelPosCorrectX = (xpos - AccelNullShiftX) * SFX;
AccelCorrectX = cat(2, AccelNegCorrectX / Gravity, AccelPosCorrectX / Gravity);

figure(1)
plot(AccelCorrectX, '.')
title('Accelerometer X-Calibrated')

% Calculate the Accelerometer scale factor and null shift in Y-direction
AveYPos = mean(ypos, 'all');
AveYNeg = mean(yneg, 'all');
AccelNullShiftY = (AveYPos + AveYNeg) / 2;
YnegShift = AveYNeg - AccelNullShiftY;
YposShift = AveYPos - AccelNullShiftY;
SFY = Gravity / YposShift;
yNegCorrect = YnegShift * SFY;
yPosCorrect = YposShift * SFY;
AccelNegCorrectY = (yneg - AccelNullShiftY) * SFY;
AccelPosCorrectY = (ypos - AccelNullShiftY) * SFY;
AccelCorrectY = cat(2, AccelNegCorrectY / Gravity, AccelPosCorrectY / Gravity);

figure(2)
plot(AccelCorrectY, '.')
title('Accelerometer Y-Calibrated')

% Calculate the Accelerometer scale factor and null shift in Z-direction
AveZPos = mean(zAccelUp, 'all');
AveZNeg = mean(zAccelDwn, 'all');
AccelNullShiftZ = (AveZPos + AveZNeg) / 2;
ZnegShift = AveZNeg - AccelNullShiftZ;
ZposShift = AveZPos - AccelNullShiftZ;
SFZ = Gravity / ZposShift;
zNegCorrect = ZnegShift * SFZ;
zPosCorrect = ZposShift * SFZ;
AccelNegCorrectZ = (zAccelDwn - AccelNullShiftZ) * SFZ;
AccelPosCorrectZ = (zAccelUp - AccelNullShiftZ) * SFZ;
AccelCorrectZ = cat(2, AccelNegCorrectZ / Gravity, AccelPosCorrectZ / Gravity);

figure(3)
plot(AccelCorrectZ, '.')
title('Accelerometer Z-Calibrated')


%CalibrateEllipsoidData3D(xAccel,yAccel,zAccel,20,1);