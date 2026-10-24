//Maya ASCII 2027 scene
//Name: bike_rig.ma
//Last modified: Sun, Oct 25, 2026 02:09:53 AM
//Codeset: 932
requires maya "2027";
requires -nodeType "wheelRoll" "wheelRollNode.py" "0.5";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2027";
fileInfo "version" "2027";
fileInfo "cutIdentifier" "202607171511-52c21617ee";
fileInfo "osv" "Windows 11 Home v2009 (Build: 26200)";
fileInfo "UUID" "E5092ECA-4600-1517-EA4A-D99BBD60205B";
createNode transform -s -n "persp";
	rename -uid "8DB167F1-4406-51AD-F6BD-6E9B2C3A850D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.3085852842994274 3.4916572775635943 2.2573713123541692 ;
	setAttr ".r" -type "double3" 335.06164754093356 5824.9999999878428 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "C26D08FE-428A-5B04-9332-84B508A77534";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 6.6776371361933773;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 0.11358391799634883 -0.066844136199041948 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "56B12FD3-4876-1021-471E-C79E526B2F1F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 96.805823632803765 1000.1 -123.93556040013661 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "4F1A1F52-48D5-0CB5-7B09-3792834B0B2C";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 894.11551010594724;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "4B319D76-4108-934C-CAFC-76A29B7FDC9E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E8F27682-4C0B-D919-F574-AF9C343254A9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "904407E7-4847-1BDE-2F3B-EA8F202B936B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "19000FC0-4E36-D255-D0C0-0C865FFE2306";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "BikeRig_guides";
	rename -uid "A6E18A46-4028-F9BE-8FC7-CD8C9CD05B55";
	setAttr ".v" no;
createNode transform -n "guide_root" -p "BikeRig_guides";
	rename -uid "77E79478-4153-BA02-A101-33BDBDE15E22";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	addAttr -ci true -k true -sn "tyreProfile" -ln "tyreProfile" -dv 8.2296 -min 0 -at "double";
	setAttr ".guideLabel" -type "string" "Root (ground, between the tyres)";
	setAttr -k on ".tyreProfile" 8.2296000000000014;
createNode locator -n "guide_rootShape" -p "guide_root";
	rename -uid "D068720A-4F36-0149-6B3D-B5AF6B3DBCE3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_root_label" -p "guide_root";
	rename -uid "F11B2F80-4926-112B-0D3A-6184BE70FF4C";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_root_labelShape" -p "guide_root_label";
	rename -uid "F2819663-4F3E-167E-B64F-3A86F11CCF75";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "root";
createNode transform -n "guide_body" -p "BikeRig_guides";
	rename -uid "53FC6059-4A1C-E2C7-126B-93A9A167819D";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 0 57.146063493203336 17.14748730665325 ;
	setAttr ".guideLabel" -type "string" "Body / COG pivot";
createNode locator -n "guide_bodyShape" -p "guide_body";
	rename -uid "B7D13317-459F-FD1D-018E-51A4D038C1E0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_body_label" -p "guide_body";
	rename -uid "20167BEF-42BA-0103-1B6D-51A8B0378168";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_body_labelShape" -p "guide_body_label";
	rename -uid "873374B1-4A81-D762-B3EE-5C8B55D01497";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "body";
createNode transform -n "guide_steerTop" -p "BikeRig_guides";
	rename -uid "F5A36991-4A17-C582-FAE4-B4B2A81C7B05";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -0.0055175120544433591 94.110103262940243 51.747798712755824 ;
	setAttr ".guideLabel" -type "string" "Steering axis top";
createNode locator -n "guide_steerTopShape" -p "guide_steerTop";
	rename -uid "D8219C2B-474A-2B97-85C7-80B51AE686DE";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 21;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_steerTop_label" -p "guide_steerTop";
	rename -uid "741891AC-4DEE-6CE4-6669-2099CB6BAC44";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_steerTop_labelShape" -p "guide_steerTop_label";
	rename -uid "D68D64A3-4470-1C86-3B6F-3DA5B47D8BB6";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "steerTop";
createNode transform -n "guide_steerBottom" -p "BikeRig_guides";
	rename -uid "24C23D1A-425F-3209-C310-3B9986FADA02";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -0.0055222160208131159 66.565545663832268 63.634654759221654 ;
	setAttr ".guideLabel" -type "string" "Steering axis bottom";
createNode locator -n "guide_steerBottomShape" -p "guide_steerBottom";
	rename -uid "848D607D-4D93-D464-8DDA-14A6B83AB11F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 21;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_steerBottom_label" -p "guide_steerBottom";
	rename -uid "2A4F5C4B-4C8E-1140-4BFB-608F7568FA82";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_steerBottom_labelShape" -p "guide_steerBottom_label";
	rename -uid "8B33FA48-4DF5-66CF-2FC5-83AC6D104EC7";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "steerBottom";
createNode transform -n "guide_frontAxle" -p "BikeRig_guides";
	rename -uid "84AE4FC4-4E27-8404-978A-F5B919107EFF";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	addAttr -ci true -k true -sn "radius" -ln "radius" -dv 32.47 -min 0.01 -at "double";
	setAttr ".t" -type "double3" -0.005529255524916097 32.467942407271273 81.422887206221446 ;
	setAttr ".guideLabel" -type "string" "Front axle";
	setAttr -k on ".radius" 32.596782810986042;
createNode locator -n "guide_frontAxleShape" -p "guide_frontAxle";
	rename -uid "E6B163CA-4194-9FA5-16E8-77AF35C638BA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_frontAxle_label" -p "guide_frontAxle";
	rename -uid "2AAC3B68-48CD-7CCC-8254-25A050A9978F";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_frontAxle_labelShape" -p "guide_frontAxle_label";
	rename -uid "6C4E124B-48E6-6734-793D-CCB0231B3276";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "frontAxle";
createNode transform -n "guide_rearAxle" -p "BikeRig_guides";
	rename -uid "BD64742E-471C-E84E-4116-A18CDD5DAF78";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	addAttr -ci true -k true -sn "radius" -ln "radius" -dv 34.5 -min 0.01 -at "double";
	setAttr ".t" -type "double3" 0.041850468749997205 34.50337507934649 -66.082798806775386 ;
	setAttr ".guideLabel" -type "string" "Rear axle";
	setAttr -k on ".radius" 35.415870696306229;
createNode locator -n "guide_rearAxleShape" -p "guide_rearAxle";
	rename -uid "0EE49A6C-4107-0AB7-B8B8-9AA28E7D748A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_rearAxle_label" -p "guide_rearAxle";
	rename -uid "C984DA19-4ADD-1685-47E7-5A8441C42827";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_rearAxle_labelShape" -p "guide_rearAxle_label";
	rename -uid "09CD7B82-4060-13FE-4ECD-128433FC847C";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "rearAxle";
createNode transform -n "guide_swingPivot" -p "BikeRig_guides";
	rename -uid "88FA1EE9-4BD1-CB50-1ED5-3B8F4F982A03";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -0.16914548950195313 34.748137813721478 -12.483223953259809 ;
	setAttr ".guideLabel" -type "string" "Swing arm pivot";
createNode locator -n "guide_swingPivotShape" -p "guide_swingPivot";
	rename -uid "61CCDF45-4469-EBF4-A3DD-2F98021B92B1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_swingPivot_label" -p "guide_swingPivot";
	rename -uid "7C95C912-4D48-505F-2F34-80B9BF2117A2";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_swingPivot_labelShape" -p "guide_swingPivot_label";
	rename -uid "BF007F5D-4F55-4530-16E9-5DA76997537A";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "swingPivot";
createNode transform -n "guide_shockTop" -p "BikeRig_guides";
	rename -uid "EDDC53FE-4E94-6410-AF0E-4E8A69DE3CCD";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -3.720703125e-06 70.099818126221479 -8.1846323809941843 ;
	setAttr ".guideLabel" -type "string" "Rear shock top (optional)";
createNode locator -n "guide_shockTopShape" -p "guide_shockTop";
	rename -uid "E6064DAD-4B74-12C6-5B88-F7BE45759B66";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_shockTop_label" -p "guide_shockTop";
	rename -uid "C5EAA191-4525-3CAC-F6E9-71BF004CC703";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_shockTop_labelShape" -p "guide_shockTop_label";
	rename -uid "C2475CCC-427A-6654-42A3-EDA01DE9FE11";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "shockTop";
createNode transform -n "guide_shockBottom" -p "BikeRig_guides";
	rename -uid "22389D51-4E8D-FE4E-E5F7-C49D435526BA";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 0 57.133297960205851 -28.74647498353325 ;
	setAttr ".guideLabel" -type "string" "Rear shock bottom (optional)";
createNode locator -n "guide_shockBottomShape" -p "guide_shockBottom";
	rename -uid "DBEA7714-47D0-C412-B651-C384EDF488ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".los" -type "double3" 7.5 7.5 7.5 ;
createNode transform -n "guide_shockBottom_label" -p "guide_shockBottom";
	rename -uid "778E5C49-4ED7-D38B-E538-D2AC2D594AB1";
	setAttr ".t" -type "double3" 0 10.5 0 ;
createNode annotationShape -n "guide_shockBottom_labelShape" -p "guide_shockBottom_label";
	rename -uid "89BFAF9B-4D4F-7D16-EC36-14AA0A690E74";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "shockBottom";
createNode transform -n "guide_L_lever" -p "BikeRig_guides";
	rename -uid "9E7FB755-4FFC-2A82-A4E2-F583A475BE10";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 16.915168447265629 89.085048126221452 58.799714318224574 ;
	setAttr ".r" -type "double3" -62.188263546628548 63.318923015256146 -7.0832633418986178e-15 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "L lever pivot";
createNode locator -n "guide_L_leverShape" -p "guide_L_lever";
	rename -uid "E71E8C8D-464B-6D64-C724-B0B39BB011FB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_L_lever_label" -p "guide_L_lever";
	rename -uid "CC0741B9-4A21-9D72-5A91-2F992E95D7C3";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_L_lever_labelShape" -p "guide_L_lever_label";
	rename -uid "D4016D4F-4404-7944-16AB-08A332E6BB9A";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_lever";
createNode transform -n "guide_L_lever_tip" -p "BikeRig_guides";
	rename -uid "3B7110F1-4C75-DB10-B129-D7991B7AE9D5";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 31.051797656249988 83.699508946533982 53.406142140490189 ;
	setAttr ".guideLabel" -type "string" "L lever tip";
createNode locator -n "guide_L_lever_tipShape" -p "guide_L_lever_tip";
	rename -uid "B899004B-42C5-5989-7B97-12BEE1F6F4F6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_L_lever_tip_label" -p "guide_L_lever_tip";
	rename -uid "7A0AE607-4CC5-A9F0-4392-97965721C038";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_L_lever_tip_labelShape" -p "guide_L_lever_tip_label";
	rename -uid "489DCC5C-4370-95B0-8083-CC998531129D";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_lever_tip";
createNode transform -n "guide_R_lever" -p "BikeRig_guides";
	rename -uid "975DF406-4980-28B7-4115-EA9D6FABAAB2";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -16.915159145507829 89.08504812622148 58.799699435412087 ;
	setAttr ".r" -type "double3" -62.788928193434643 -64.69179100078037 0 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "R lever pivot";
createNode locator -n "guide_R_leverShape" -p "guide_R_lever";
	rename -uid "0FBE1036-4FFE-38FC-C409-D592F514A555";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_R_lever_label" -p "guide_R_lever";
	rename -uid "086FE7A1-4394-D600-EE10-99BDB0F4D73A";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_R_lever_labelShape" -p "guide_R_lever_label";
	rename -uid "5D2CF17B-4C06-8E2B-3AA9-499439710D87";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_lever";
createNode transform -n "guide_R_lever_tip" -p "BikeRig_guides";
	rename -uid "13A81922-4D1F-E2B3-087A-9880D3687289";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -31.051808818359373 83.699508946533967 53.406123536974583 ;
	setAttr ".guideLabel" -type "string" "R lever tip";
createNode locator -n "guide_R_lever_tipShape" -p "guide_R_lever_tip";
	rename -uid "BB8D0B5B-4192-377A-A940-35BA1EBB1464";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_R_lever_tip_label" -p "guide_R_lever_tip";
	rename -uid "F31D4BDD-42D3-2137-EA43-73A8AD78A3D6";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_R_lever_tip_labelShape" -p "guide_R_lever_tip_label";
	rename -uid "0017062A-472B-41D5-4995-A7911003DFA7";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_lever_tip";
createNode transform -n "guide_L_mirror" -p "BikeRig_guides";
	rename -uid "16F3AF14-44F9-C3E0-ADA7-ACBF6A0A7AA4";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 32.57451401367188 87.23233888794023 47.336480997912076 ;
	setAttr ".r" -type "double3" 93.22971560832228 0 171.54423165675212 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1.0000000000000002 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "L mirror pivot";
createNode locator -n "guide_L_mirrorShape" -p "guide_L_mirror";
	rename -uid "927834E4-49A1-BAC0-1EDC-D3893E7EBD65";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_L_mirror_label" -p "guide_L_mirror";
	rename -uid "3ADAD973-4CE7-E5A8-F5A8-B7A05B944EE5";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_L_mirror_labelShape" -p "guide_L_mirror_label";
	rename -uid "63931A5C-4781-2283-A389-9E8811B6C3BF";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_mirror";
createNode transform -n "guide_L_mirror_tip" -p "BikeRig_guides";
	rename -uid "DDD86AA1-46FA-E459-AE1D-2986F9FEF7E4";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 40.240457255859397 86.12283265747152 42.83988476744333 ;
	setAttr ".guideLabel" -type "string" "L mirror tip";
createNode locator -n "guide_L_mirror_tipShape" -p "guide_L_mirror_tip";
	rename -uid "C2C9609F-46B8-C7E6-3151-B9B25414F5DB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_L_mirror_tip_label" -p "guide_L_mirror_tip";
	rename -uid "9C46C8E0-4DD1-93C2-7E57-A393D6B888A3";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_L_mirror_tip_labelShape" -p "guide_L_mirror_tip_label";
	rename -uid "76BB0A02-4E60-FC1D-9467-76826777C524";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_mirror_tip";
createNode transform -n "guide_R_mirror" -p "BikeRig_guides";
	rename -uid "774D17B5-4B58-4403-65F5-14B944AA5790";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -32.574525175781268 87.23233888794023 47.336466115099562 ;
	setAttr ".r" -type "double3" 93.229750074715568 0 -171.54419330497774 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "R mirror pivot";
createNode locator -n "guide_R_mirrorShape" -p "guide_R_mirror";
	rename -uid "2D5EC26D-430C-4635-5DA6-5CB739F0B969";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_R_mirror_label" -p "guide_R_mirror";
	rename -uid "05880B0C-4ED2-E7E9-7DFD-21962B46AD82";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_R_mirror_labelShape" -p "guide_R_mirror_label";
	rename -uid "23EBA54C-48C5-4B63-F929-16B1502B932E";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_mirror";
createNode transform -n "guide_R_mirror_tip" -p "BikeRig_guides";
	rename -uid "8C1F37FD-436F-2491-132E-07ACD8783DE9";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -40.240475859375003 86.12283265747152 42.839858722521413 ;
	setAttr ".guideLabel" -type "string" "R mirror tip";
createNode locator -n "guide_R_mirror_tipShape" -p "guide_R_mirror_tip";
	rename -uid "D60EFDCB-437D-3F14-F947-52A4D8FDFFA7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_R_mirror_tip_label" -p "guide_R_mirror_tip";
	rename -uid "B91D47CA-44B7-E0ED-7833-04A1317ECF67";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_R_mirror_tip_labelShape" -p "guide_R_mirror_tip_label";
	rename -uid "FB34C7F8-4BB6-3CC8-CA00-D5B0A6EF66A9";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_mirror_tip";
createNode transform -n "guide_L_pedal" -p "BikeRig_guides";
	rename -uid "20D17CFC-4582-DA46-F38E-F08271CF71EE";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 14.713178203125 21.055154083252731 0.36574896910347121 ;
	setAttr ".r" -type "double3" 0 86.674234882718125 0 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "L pedal pivot";
createNode locator -n "guide_L_pedalShape" -p "guide_L_pedal";
	rename -uid "8BD8D89A-4950-5E08-E587-6290398A1890";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_L_pedal_label" -p "guide_L_pedal";
	rename -uid "1ACF3A7B-4DC1-839C-AD3B-56A2A5C67BCD";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_L_pedal_labelShape" -p "guide_L_pedal_label";
	rename -uid "F811F292-4A52-9F71-3841-9BB8930A8273";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_pedal";
createNode transform -n "guide_L_pedal_tip" -p "BikeRig_guides";
	rename -uid "F042FAA9-46D0-1E10-408D-8DA52CAC043E";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 15.796319531250001 31.876391241455856 -18.273484475720739 ;
	setAttr ".guideLabel" -type "string" "L pedal tip";
createNode locator -n "guide_L_pedal_tipShape" -p "guide_L_pedal_tip";
	rename -uid "00E78DC3-420B-C571-8866-3D857C63557A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_L_pedal_tip_label" -p "guide_L_pedal_tip";
	rename -uid "0A89E20F-44B3-7EAC-DD7E-73B9BF32ED79";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_L_pedal_tip_labelShape" -p "guide_L_pedal_tip_label";
	rename -uid "F4DF0882-4F27-7849-1B83-8499D283A6EB";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_pedal_tip";
createNode transform -n "guide_R_pedal" -p "BikeRig_guides";
	rename -uid "1B498986-4145-1F77-603E-5E9C28DDEE52";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -15.468425126953125 27.92873080688554 2.8811654308954644 ;
	setAttr ".r" -type "double3" 0 -88.324901506804352 0 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "R pedal pivot";
createNode locator -n "guide_R_pedalShape" -p "guide_R_pedal";
	rename -uid "ABD0156E-4A70-5677-6D12-F3950D8B5B55";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_R_pedal_label" -p "guide_R_pedal";
	rename -uid "10F51161-492B-F6A8-781B-9CB7FFA56834";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_R_pedal_labelShape" -p "guide_R_pedal_label";
	rename -uid "D3ECF721-4549-4AD7-D405-B995C9AF9C19";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_pedal";
createNode transform -n "guide_R_pedal_tip" -p "BikeRig_guides";
	rename -uid "7DEABAB9-4682-72B2-3246-7C88C9F625D7";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" -16.08887283691406 31.848285050049586 -18.334844451306683 ;
	setAttr ".guideLabel" -type "string" "R pedal tip";
createNode locator -n "guide_R_pedal_tipShape" -p "guide_R_pedal_tip";
	rename -uid "234058DB-4B1F-C984-1A7C-0198DB8E4ADA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_R_pedal_tip_label" -p "guide_R_pedal_tip";
	rename -uid "1361D32A-4F2D-BA8E-5AE2-C5A3A5A28E90";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_R_pedal_tip_labelShape" -p "guide_R_pedal_tip_label";
	rename -uid "545A7D16-4715-B679-00B3-F8A499CE20B4";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "R_pedal_tip";
createNode transform -n "guide_L_stand" -p "BikeRig_guides";
	rename -uid "92EF64E5-4E3D-49CA-A91A-57A856E345FA";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 14.243283164062493 24.59018109985432 -13.536637793591833 ;
	setAttr ".r" -type "double3" -7.3577470484877505 84.313929991452355 0 ;
	setAttr ".dla" yes;
	setAttr ".guideLabel" -type "string" "L stand pivot";
createNode locator -n "guide_L_standShape" -p "guide_L_stand";
	rename -uid "4EFF1149-4FF2-D626-06DD-01921FEA5D80";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 3.6 3.6 3.6 ;
createNode transform -n "guide_L_stand_label" -p "guide_L_stand";
	rename -uid "F6C8C3B6-45E9-A11B-8F0D-F99476E486FB";
	setAttr ".t" -type "double3" 0 5.04 0 ;
createNode annotationShape -n "guide_L_stand_labelShape" -p "guide_L_stand_label";
	rename -uid "1399AD85-40A5-F41A-807B-2B99E6788298";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_stand";
createNode transform -n "guide_L_stand_tip" -p "BikeRig_guides";
	rename -uid "7ED8D0B0-4D15-AAE5-352C-2180801D8F4D";
	addAttr -ci true -sn "guideLabel" -ln "guideLabel" -dt "string";
	setAttr ".t" -type "double3" 22.897400507812499 24.809667237549633 -33.640682293103538 ;
	setAttr ".guideLabel" -type "string" "L stand tip";
createNode locator -n "guide_L_stand_tipShape" -p "guide_L_stand_tip";
	rename -uid "CFDD3820-4A5B-56D9-6091-788378A159AD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".los" -type "double3" 2.4 2.4 2.4 ;
createNode transform -n "guide_L_stand_tip_label" -p "guide_L_stand_tip";
	rename -uid "18700309-4FE3-E237-4B40-0B97A09D93E8";
	setAttr ".t" -type "double3" 0 3.36 0 ;
createNode annotationShape -n "guide_L_stand_tip_labelShape" -p "guide_L_stand_tip_label";
	rename -uid "B5749607-43A3-75EF-852D-CAA01B9C7B0B";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".txt" -type "string" "L_stand_tip";
createNode transform -n "BikeRig";
	rename -uid "34A898AA-43AD-E33C-87C7-3DA86103B41D";
	addAttr -ci true -sn "builderVersion" -ln "builderVersion" -dt "string";
	addAttr -ci true -sn "jointMap" -ln "jointMap" -dt "string";
	addAttr -ci true -sn "restPose" -ln "restPose" -dt "string";
	setAttr ".builderVersion" -type "string" "2.0";
	setAttr ".jointMap" -type "string" "{\"root\": \"rootJnt\", \"body\": \"bodyJnt\", \"steer\": \"steerJnt\", \"forkSlide\": \"Front_Piston1Jnt\", \"wheelF\": \"Front_wheelJnt\", \"swingarm\": \"Rear_ForkJnt\", \"wheelR\": \"Rear_WheelJnt\", \"shockTop\": \"Rear_PistonJnt\", \"shockBottom\": \"Rear_Piston2Jnt\", \"L_lever\": \"L_BrakeJnt\", \"R_lever\": \"R_BrakeJnt\", \"L_mirror\": \"L_Mirror2Jnt\", \"R_mirror\": \"R_Mirror2Jnt\", \"L_pedal\": \"L_Pedal_1\", \"R_pedal\": \"R_Pedal_1\", \"L_stand\": \"standJnt\"}";
	setAttr ".restPose" -type "string" (
		"{\"rootJnt\": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \"bodyJnt\": [0.0, 57.146063493203336, 17.14748730665325, 0.0, 0.0, 0.0], \"steerJnt\": [-0.005517512054443359, 36.96403976973691, 34.60031140610258, 0.0, 0.0, 0.0], \"Front_Piston1Jnt\": [36.40749898686938, 2.821857793091496, 0.0, 0.0, 0.0, 0.0], \"Front_wheelJnt\": [-2.3174623902222359e-07, -3.2975934642109904e-06, -6.0653342559064765, 4.3999966692354064e-06, 0.0, 0.0], \"Rear_ForkJnt\": [-0.16914548950195313, -22.39792567948185, -29.630711259913063, 0.0, 0.0, 0.0], \"Rear_WheelJnt\": [6.7065771496582025, -0.24366140624999091, -53.59936649414063, -4.87292936668382e-06, 0.0, 0.0], \"Rear_PistonJnt\": [-3.720703125000001e-06, 12.953754633018143, -25.332119687647435, 0.0, 0.0, 0.0], \"Rear_Piston2Jnt\": [0.16914548950195313, 22.385160146484367, -16.263251030273445, 0.0, 0.0, 0.0], \"L_BrakeJnt\": [7.407931540517147, 4.483653460151302, -16.920688749960657, 0.0, 0.0, 0.0], \"R_BrakeJnt\": [7.4079309480795885, 4.483652087338683, 16.909638842813404, -1.2326575216530755e-08, 0.0, 0.0], \"L_Mirror2Jnt\": [3.6455966968490543, -0.02872851623921946, 0.025137161892117454, -6.07529403747015e-08, -3.071132815727503e-07, 4.929177075688456e-07], \"R_Mirror2Jnt\": [3.6455881810149577, -0.028736917659301753, -0.02508382405624765, -4.2008818446812676e-07, 3.220291292281986e-07, -1.8840343529863683e-07], \"L_Pedal_1\": [14.713178203125, -36.0909094099506, -16.78173833754978, 0.0, 0.0, 0.0], \"R_Pedal_1\": [-15.46842512695313, -29.217332686317793, -14.266321875757788, 0.0, 0.0, 0.0], \"standJnt\": [14.243283164062495, -32.55588239334901, -30.684125100245083, 0.0, 0.0, 0.0]}");
createNode transform -n "Controls" -p "BikeRig";
	rename -uid "D73E049A-4BD1-7D5B-DB7E-89B5409786E1";
createNode transform -n "Root_ctrl_offset" -p "Controls";
	rename -uid "78AB5959-44FE-5701-1A23-0FAE617EBE5A";
createNode transform -n "Root_ctrl" -p "Root_ctrl_offset";
	rename -uid "50F589FC-4BBF-8FD2-02A5-B9AAAF0E7E6D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.81999999 0.1 ;
	setAttr -cb on ".ro";
	setAttr -k off ".sx";
	setAttr -k off ".sz";
createNode transform -n "Drive_ctrl_offset" -p "Root_ctrl";
	rename -uid "7D0A0AE7-49EB-673A-C22F-20AE689F4DBD";
createNode transform -n "Drive_ctrl" -p "Drive_ctrl_offset";
	rename -uid "2BD2E031-4673-BCC5-8BDC-17A7C70408B3";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.34999999 0.94999999 0.34999999 ;
	setAttr -cb on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 8.2296000000000014 0 ;
	setAttr ".sp" -type "double3" 0 8.2296000000000014 0 ;
createNode transform -n "COG_ctrl_offset" -p "Drive_ctrl";
	rename -uid "7EF9CCC0-4A3B-BC3A-4180-5EA79B2C8D29";
	setAttr ".t" -type "double3" 0 57.146063493203336 17.14748730665325 ;
createNode transform -n "COG_ctrl" -p "COG_ctrl_offset";
	rename -uid "242497F4-4DB5-7F2E-FFFF-538D3536CC89";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr -cb on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Wheelie_ctrl_offset" -p "COG_ctrl";
	rename -uid "741F8DB3-4E64-E1CA-07D6-3784195ED4E4";
	setAttr ".t" -type "double3" 0 -22.642688413856845 -83.230286113428633 ;
createNode transform -n "Wheelie_ctrl" -p "Wheelie_ctrl_offset";
	rename -uid "E1063BAD-4DE4-EE78-6CC0-5DA66E918A95";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.75 0.44999999 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Stoppie_ctrl_offset" -p "Wheelie_ctrl";
	rename -uid "21F36DF3-4289-75F8-5A4F-9DA631E1789D";
	setAttr ".t" -type "double3" 0 -2.0354326720752169 147.50568601299682 ;
createNode transform -n "Stoppie_ctrl" -p "Stoppie_ctrl_offset";
	rename -uid "163AE043-44F3-C7FF-0EEE-0C9A7323A472";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.75 0.44999999 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Body_auto" -p "Stoppie_ctrl";
	rename -uid "7F9E9AFE-4E46-2A29-0D73-51A1DF7298CF";
createNode transform -n "Body_ctrl_offset" -p "Body_auto";
	rename -uid "5A9F68A2-451A-0648-7BF5-45AE75C0B7EC";
	setAttr ".t" -type "double3" 0 24.678121085932062 -64.275399899568185 ;
createNode transform -n "Body_ctrl" -p "Body_ctrl_offset";
	rename -uid "BFB60AE8-4E3C-742A-BCC9-AFB5A3296B73";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.81999999 0.1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Steer_ctrl_offset" -p "Body_ctrl";
	rename -uid "D00A29BD-4A66-9E99-AEFC-6F814769A160";
	setAttr ".t" -type "double3" -0.0055175120544433591 36.964039769736907 34.600311406102577 ;
	setAttr ".r" -type "double3" 90.000003877008822 -23.342616686872294 -90.000009784779422 ;
createNode transform -n "Steer_ctrl" -p "Steer_ctrl_offset";
	rename -uid "76E20014-4BB1-22DF-F920-71BF31BB40B7";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "L_Lever_ctrl_offset" -p "Steer_ctrl";
	rename -uid "B612265C-42DF-72CD-8417-AFABFDE44724";
	setAttr ".t" -type "double3" 7.407931557057978 4.483659618105122 -16.920687120875645 ;
	setAttr ".r" -type "double3" -118.54594442118885 61.667982027497196 -68.385331133645437 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999989 1 ;
createNode transform -n "L_Lever_ctrl" -p "L_Lever_ctrl_offset";
	rename -uid "C0AB74F5-4A34-E74B-7D0F-8AB517C3469F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "L_Lever_ctrlShape" -p "L_Lever_ctrl";
	rename -uid "55B05572-411B-4BEC-2A54-CC8106621620";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		17.367123400984532 0.0086168263553102926 2.7231329497215162
		18.530290376147875 0.0086168263553100585 2.3376717300825467
		19.315535208713253 0.0086168263553094617 1.2502106014974046
		19.315535208713257 0.0086168263553088164 0.024838079751937386
		19.315535208713257 0.0086168263553081693 -1.2005344419935313
		18.530290376147882 0.0086168263553076177 -2.287995570578671
		17.367123400984539 0.008616826355307446 -2.6734567902176427
		17.291789022836983 0.0086168263553075674 -2.4461279183887066
		17.216454644689431 0.0086168263553076906 -2.2187990465597682
		17.141120266541876 0.0086168263553078137 -1.9914701747308297
		16.918392539844746 0.0086168263553076229 -2.3606121770963733
		16.695664813147623 0.0086168263553074356 -2.7297541794619224
		16.4729370864505 0.0086168263553072465 -3.0988961818274698
		16.905290908862565 0.0086168263553070973 -3.362321474985928
		17.337644731274622 0.0086168263553069464 -3.6257467681443822
		17.76999855368669 0.0086168263553067954 -3.8891720613028493
		17.694664175539131 0.0086168263553069169 -3.6618431894739016
		17.619329797391575 0.0086168263553070383 -3.4345143176449624
		17.54399541924402 0.0086168263553071597 -3.2071854458160196
		18.937239378505605 0.0086168263553073644 -2.7454791497649444
		19.877807364765243 0.0086168263553080254 -1.4429158199212062
		19.877807364765239 0.0086168263553088008 0.024838079751938351
		19.877807364765236 0.0086168263553095745 1.4925919794250795
		18.937239378505598 0.0086168263553102874 2.7951553092688242
		17.543995419244013 0.0086168263553105685 3.2568616053198931
		17.619329797391568 0.0086168263553106864 3.4841904771488328
		17.694664175539121 0.0086168263553108044 3.7115193489777765
		17.769998553686669 0.0086168263553109224 3.9388482208067037
		17.337644731274615 0.0086168263553107957 3.6754229276482513
		16.905290908862558 0.0086168263553106691 3.4119976344897958
		16.472937086450493 0.0086168263553105407 3.1485723413313393
		16.695664813147616 0.0086168263553103412 2.7794303389657906
		16.918392539844739 0.00861682635531014 2.4102883366002446
		17.141120266541861 0.0086168263553099405 2.041146334234698
		17.216454644689424 0.0086168263553100585 2.2684752060636395
		17.291789022836976 0.0086168263553101747 2.495804077892577
		17.367123400984532 0.0086168263553102926 2.7231329497215162
		;
createNode transform -n "R_Lever_ctrl_offset" -p "Steer_ctrl";
	rename -uid "45F2ABAD-49C5-34B0-4993-1FA95FD0912E";
	setAttr ".t" -type "double3" 7.4079309646204194 4.4836459534222826 16.909640471898317 ;
	setAttr ".r" -type "double3" -60.580631781233727 -61.668001787752154 -68.385319914179178 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 0.99999999999999989 ;
createNode transform -n "R_Lever_ctrl" -p "R_Lever_ctrl_offset";
	rename -uid "026A93AE-4C69-6038-9CE1-DE82F833AD98";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_Lever_ctrlShape" -p "R_Lever_ctrl";
	rename -uid "0EFB2E7D-4872-5F71-086D-CC8C0306D8E8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		17.367126802133125 0.032896788144113259 2.722962321634721
		18.530293747918321 0.027021438468782348 2.3375457931163677
		19.315538497602557 0.010444731634862358 1.2502109554797212
		19.315538404210507 -0.0082346526359232813 0.024980814791032261
		19.315538310818482 -0.026914036906708922 -1.2002493258977107
		18.530293395372123 -0.043491499829223082 -2.2875840322981738
		17.367126390830947 -0.049367969482923831 -2.6730003664191138
		17.291792030009329 -0.045902640503516938 -2.4456979025685208
		17.216457669187683 -0.04243731152408297 -2.2183954387178999
		17.141123308366023 -0.03897198254467607 -1.991092974867279
		16.918395553534694 -0.044599231879586955 -2.3601920664982936
		16.695667798703361 -0.05022648121449784 -2.7292911581293069
		16.472940043872022 -0.055853730549462875 -3.098390249760294
		16.905293846207034 -0.059869135765989824 -3.3617849705831704
		17.337647648542049 -0.063884540982462615 -3.6251796914060197
		17.770001450877011 -0.067899946198989564 -3.8885744122289232
		17.694667090055407 -0.064434617219555596 -3.6612719483783023
		17.619332729233761 -0.060969288240121627 -3.4339694845277089
		17.543998368412126 -0.057503959260714735 -3.2066670206770613
		18.93724236286263 -0.050465110994197024 -2.7450144885981387
		19.87781044839727 -0.030608589471661708 -1.4426025875250366
		19.877810560262404 -0.0082343819384758619 0.02498076780542852
		19.877810672127598 0.01413982559465584 1.4925641231358393
		18.937242785143216 0.033995441472683907 2.7949761814038863
		17.543998861070815 0.041032948226633857 3.2566289463324267
		17.619333256544273 0.044498349743220388 3.4839313975925785
		17.694667652017735 0.047963751259861055 3.7112338488527579
		17.770002047491211 0.051429152776474661 3.9385363001128821
		17.337648205002196 0.047413331259512387 3.6751416515483202
		16.905294362513182 0.04339750974252303 3.4117470029837578
		16.472940520024135 0.0393816882256149 3.1483523544191421
		16.695668218587009 0.033754653348446607 2.7792532255641649
		16.918395917149866 0.028127618471332459 2.4101540967092152
		17.141123615712743 0.022500583594218311 2.041054967854238
		17.216458011186202 0.025965985110858982 2.2683574191143903
		17.291792406659663 0.029431386627499657 2.4956598703745421
		17.367126802133125 0.032896788144113259 2.722962321634721
		;
createNode transform -n "L_Mirror_ctrl_offset" -p "Steer_ctrl";
	rename -uid "893135F7-4AC0-DB76-CC83-8A959062BB81";
	setAttr ".t" -type "double3" 4.5669375024445245 -6.7754263310539358 -32.580032241817399 ;
	setAttr ".r" -type "double3" 16.269924889786594 121.60258541494609 83.881634531779284 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
createNode transform -n "L_Mirror_ctrl" -p "L_Mirror_ctrl_offset";
	rename -uid "0666A0A5-480F-19CD-EEE2-67A7B93E0B86";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "L_Mirror_ctrlShape" -p "L_Mirror_ctrl";
	rename -uid "FB2C5249-41EE-6D4C-C97B-5397C31991CA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		8.1327750624349058 2.3662271793291776 3.9416116091759905
		9.2685018949096207 2.3662271793291771 3.7616727904973168
		10.161098010297557 2.3662271793291763 2.8741874783344077
		10.347555394160091 2.3662271793291754 1.7395126080850871
		10.534012778022625 2.3662271793291745 0.60483773783576678
		9.9723611770413871 2.3662271793291736 -0.52161931133466011
		8.9539408604529047 2.3662271793291731 -1.055542035359724
		8.8495912264841028 2.3662271793291736 -0.85650239436692943
		8.7452415925153062 2.3662271793291736 -0.65746275337413707
		8.6408919585465043 2.366227179329174 -0.45842311238134603
		8.4908197935705534 2.3662271793291736 -0.83413366203372452
		8.340747628594599 2.3662271793291731 -1.2098442116861041
		8.1906754636186463 2.3662271793291727 -1.5855547613384815
		8.6311118274643057 2.3662271793291727 -1.763693647492133
		9.0715481913099616 2.3662271793291727 -1.9418325336457856
		9.5119845551556246 2.3662271793291723 -2.1199714197994344
		9.4076349211868209 2.3662271793291727 -1.9209317788066427
		9.3032852872180225 2.3662271793291727 -1.7218921378138514
		9.1989356532492188 2.3662271793291727 -1.5228524968210584
		10.418801746745318 2.3662271793291731 -0.88331868452730267
		11.091549268799762 2.366227179329174 0.46595404469881219
		10.868210204612771 2.3662271793291754 1.8250700980743719
		10.644871140425781 2.3662271793291767 3.1841861514499321
		9.5757175516644111 2.3662271793291776 4.2472180088758318
		8.2153414556232658 2.366227179329178 4.4627491213590798
		8.250508623092383 2.366227179329178 4.6847150987703987
		8.2856757905614984 2.3662271793291785 4.9066810761817168
		8.3208429580306174 2.3662271793291785 5.128647053593026
		7.960574200580405 2.366227179329178 4.8189309323417584
		7.600305443130198 2.366227179329178 4.5092148110904846
		7.2400366856799945 2.3662271793291776 4.199498689839217
		7.5024489771291805 2.3662271793291776 3.8915703522068217
		7.7648612685783709 2.3662271793291771 3.5836420145744321
		8.0272735600275613 2.3662271793291771 3.2757136769420425
		8.062440727496675 2.3662271793291771 3.4976796543533606
		8.0976078949657904 2.3662271793291771 3.7196456317646742
		8.1327750624349058 2.3662271793291776 3.9416116091759905
		;
createNode transform -n "R_Mirror_ctrl_offset" -p "Steer_ctrl";
	rename -uid "A1DBC395-4434-11AA-12A1-9BB80DF802D1";
	setAttr ".t" -type "double3" 4.5669418207458534 -6.7754399957368179 32.569006947635863 ;
	setAttr ".r" -type "double3" -16.27000996669177 -58.397366452698421 -96.11826409317203 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999978 ;
createNode transform -n "R_Mirror_ctrl" -p "R_Mirror_ctrl_offset";
	rename -uid "6C72870A-4A58-DF43-D5B3-ACABCF123B23";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_Mirror_ctrlShape" -p "R_Mirror_ctrl";
	rename -uid "B7182AA3-4C41-0ADA-453C-26B193EAD8E0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		8.1327534500781109 -2.366231126474772 3.9416246020871837
		9.268480400079941 -2.3662321590894888 3.7616865252132516
		10.161077095131931 -2.3662331090183675 2.8742017960533985
		10.347535220111745 -2.3662334835137111 1.7395270475897542
		10.533993345091583 -2.3662338580090547 0.60485229912611405
		9.9723424798606075 -2.366233572774612 -0.52160511688911426
		8.953922512006498 -2.3662327757673096 -1.0555285060995268
		8.8495727480342197 -2.3662326470424406 -0.85648893326317732
		8.7452229840619626 -2.3662325183175446 -0.65744936042679658
		8.6408732200896594 -2.366232389592648 -0.45840978759047868
		8.4908013005106397 -2.3662323272373693 -0.83412043526303004
		8.3407293809316378 -2.3662322648820902 -1.2098310829355237
		8.1906574613526235 -2.3662322025267977 -1.5855417306081017
		8.631093941550132 -2.3662326230730821 -1.763680329088906
		9.0715304217476564 -2.3662330436193941 -1.9418189275696527
		9.5119669019451614 -2.3662334641657061 -2.1199575260504302
		9.4076171379729043 -2.3662333354408243 -1.9209179532140495
		9.3032673740006278 -2.3662332067159277 -1.7218783803777269
		9.1989176100283725 -2.3662330779909908 -1.5228388075413462
		10.418783285809647 -2.3662340326480731 -0.88330419848716191
		11.091529926580842 -2.3662343743025325 0.46596897014645866
		10.86818997468191 -2.3662339257311857 1.8250848776468775
		10.644850022782977 -2.3662334771598252 3.1842007851472967
		9.5756957396987232 -2.3662323393329121 4.2472319442508253
		8.2153195028834034 -2.3662311024647518 4.4627621681987479
		8.2504865253745194 -2.3662310922382765 4.6847281685795892
		8.285653547865687 -2.3662310820117871 4.9066941689604402
		8.3208205703567764 -2.3662310717852848 5.128660169341277
		7.960552015199136 -2.366230812253789 4.8189438127790583
		7.6002834600414406 -2.3662305527222531 4.5092274562168306
		7.2400149048837763 -2.3662302931907577 4.199511099654579
		7.5024273974574562 -2.3662305811785935 3.891582933417951
		7.7648398900311406 -2.3662308691664293 3.5836547671812955
		8.0272523826047362 -2.3662311571542256 3.2757266009446542
		8.0624194050958806 -2.366231146927777 3.4976926013255003
		8.0975864275869966 -2.3662311367012743 3.7196586017063424
		8.1327534500781109 -2.366231126474772 3.9416246020871837
		;
createNode nurbsCurve -n "Steer_ctrlShape" -p "Steer_ctrl";
	rename -uid "D94C7AC5-4B88-EA85-BBD2-6EB6D6459EFD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-12.801600028584081 -8.8461013710577312 -8.8461077795717351
		-12.80160002858408 -12.510281078547427 -4.54547036401409e-06
		-12.801600028584078 -8.8461077993235548 8.8461013513059044
		-12.801600028584074 -4.5454703571038326e-06 12.510281050614138
		-12.801600028584073 8.846101371057733 8.8461077795717422
		-12.801600028584074 12.510281078547438 4.5454703701862742e-06
		-12.801600028584076 8.8461077993235584 -8.8461013513058973
		-12.801600028584081 4.5454703610038458e-06 -12.510281050614131
		-12.801600028584081 -8.8461013710577312 -8.8461077795717351
		-12.80160002858408 -12.510281078547427 -4.54547036401409e-06
		-12.801600028584078 -8.8461077993235548 8.8461013513059044
		;
createNode nurbsCurve -n "Steer_ctrlShape1" -p "Steer_ctrl";
	rename -uid "C8EED8AE-4A1D-1AAF-89FB-319D88E78049";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-12.801600028584076 12.869332213594953 3.1608935648169183
		-12.801600028584076 19.191111153961785 6.9728750721541041e-06
		-12.801600028584076 12.86933451054203 -3.1608842129609376
		-12.801600028584076 12.869332213594953 3.1608935648169183
		;
createNode transform -n "L_Pedal_ctrl_offset" -p "Body_ctrl";
	rename -uid "83300A23-4579-9EE7-9C2E-8698C13885B9";
	setAttr ".t" -type "double3" 14.713178203125 -36.090909409950605 -16.781738337549776 ;
	setAttr ".r" -type "double3" 83.389718807201021 59.738003974142302 84.284072252824359 ;
createNode transform -n "L_Pedal_ctrl" -p "L_Pedal_ctrl_offset";
	rename -uid "CA4359BD-4D55-8E74-AC99-6E92923DBE25";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "L_Pedal_ctrlShape" -p "L_Pedal_ctrl";
	rename -uid "CE3C71FE-4A9A-069E-8AD9-4D8F31341656";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 1 1 2 2 2
		7
		0.046087714707372017 1.9488426881208456 5.2092148144205012e-15
		-1.2523202404437619 1.948842688120846 6.6597467454410782e-15
		-2.3048878564068622 0.8962750721766588 9.419246639199247e-15
		-2.3048878564068622 -0.40213288295112398 1.1372730336206029e-14
		-2.3048878564068627 -1.700540838078928 1.3326214033213054e-14
		-1.252320240443763 -2.7531084540231063 1.3733936998224577e-14
		0.046087714707370976 -2.7531084540231068 1.2283405067203999e-14
		;
createNode nurbsCurve -n "L_Pedal_ctrlShape1" -p "L_Pedal_ctrl";
	rename -uid "278D359C-4C79-2F15-3AD6-20B2FC826C4C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-0.46419371194619574 -1.9419570855357309 1.1633076741922397e-14
		0.046087714707370976 -2.7531084540231068 1.2283405067203999e-14
		-0.92270745763490292 -3.3255672385827584 1.422698314291983e-14
		;
createNode nurbsCurve -n "L_Pedal_ctrlShape2" -p "L_Pedal_ctrl";
	rename -uid "EBB1814C-4456-E412-ED71-1398B32A7246";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-0.46419371194619502 1.1376913196334622 6.9996771018074711e-15
		0.046087714707372017 1.9488426881208456 5.2092148144205012e-15
		-0.92270745763490158 2.5213014726804981 5.4302388986435007e-15
		;
createNode transform -n "R_Pedal_ctrl_offset" -p "Body_ctrl";
	rename -uid "094194A0-4B1C-E5C6-71F8-E3924B2CAD42";
	setAttr ".t" -type "double3" -15.468425126953125 -29.217332686317796 -14.266321875757782 ;
	setAttr ".r" -type "double3" 99.148408727952074 79.405507829179754 98.995027466695248 ;
createNode transform -n "R_Pedal_ctrl" -p "R_Pedal_ctrl_offset";
	rename -uid "23702A32-414E-8F75-205B-D68D1BAB3C3A";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_Pedal_ctrlShape" -p "R_Pedal_ctrl";
	rename -uid "A5CB7076-402F-AC9E-D642-58A9AEDEFA65";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 1 1 2 2 2
		7
		-0.71056216904647285 1.5624432251218281 0.85545588215759416
		-2.0018608420211716 1.6942151280399953 0.88781512774288784
		-3.1558865884800915 0.75405550270822941 0.89884362331670653
		-3.2881508172392158 -0.53746207177490557 0.88008871646388942
		-3.4204150459983409 -1.8289796462580576 0.86133380961107187
		-2.4808319843518221 -2.9827837385006126 0.81989760201521655
		-1.1895333113771247 -3.1145556414187854 0.78753835642992365
		;
createNode nurbsCurve -n "R_Pedal_ctrlShape1" -p "R_Pedal_ctrl";
	rename -uid "888C58B0-4CBC-6996-DB37-66881E04C2EA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-1.6143916286194542 -2.2559218058994208 0.81197242604311515
		-1.1895333113771247 -3.1145556414187854 0.78753835642992365
		-2.211338310956763 -3.5856561111249086 0.80341400602079927
		;
createNode nurbsCurve -n "R_Pedal_ctrlShape2" -p "R_Pedal_ctrl";
	rename -uid "8C56A652-4924-946B-A730-07A39FC969E0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.2 0.2 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-1.3006787315670925 0.80738354647230337 0.85645653348428474
		-0.71056216904647285 1.5624432251218281 0.85545588215759416
		-1.6157384629298068 2.2301844854069302 0.88786934043808996
		;
createNode transform -n "Stand_ctrl_offset" -p "Body_ctrl";
	rename -uid "F49C1140-4A9D-D47B-D8A3-9EAE099C51D0";
	setAttr ".t" -type "double3" 14.243283164062493 -32.555882393349016 -30.68412510024508 ;
	setAttr ".r" -type "double3" -92.460391090154417 -5.6390977874858041 7.3937268901944799 ;
createNode transform -n "Stand_ctrl" -p "Stand_ctrl_offset";
	rename -uid "12F5E096-423C-2F1B-1708-85A2A780ECB5";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 1 0.55000001 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "Stand_ctrlShape" -p "Stand_ctrl";
	rename -uid "E10D7815-4C6E-3FE6-BC79-E0A411DBE925";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 1 0.55000001 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		9.1613746176957243 22.004474362552049 4.7819702667507977
		9.1613746176957243 23.367366618055076 4.3755500950399266
		9.1613746176957243 24.316427392839913 3.1415006873601588
		9.1613746176957243 24.35935928908096 1.7199489231799641
		9.1613746176957243 24.402291185322007 0.29839715899977148
		9.1613746176957243 23.529430533373432 -0.99067559965658125
		9.1613746176957243 22.193548155752953 -1.4786007263375907
		9.1613746176957243 22.098188271005643 -1.2175164395018094
		9.1613746176957243 22.002828386258322 -0.95643215266602488
		9.1613746176957243 21.907468501511012 -0.69534786583024466
		9.1613746176957243 21.662015763361737 -1.1313920722167747
		9.1613746176957243 21.416563025212451 -1.567436278603308
		9.1613746176957243 21.171110287063172 -2.0034804849898333
		9.1613746176957243 21.681912269726716 -2.2939316854506946
		9.1613746176957243 22.192714252390267 -2.5843828859115581
		9.1613746176957243 22.703516235053804 -2.8748340863724238
		9.1613746176957243 22.608156350306498 -2.613749799536635
		9.1613746176957243 22.512796465559184 -2.3526655127008578
		9.1613746176957243 22.417436580811863 -2.0915812258650757
		9.1613746176957243 24.017559428730909 -1.5071434367636527
		9.1613746176957243 25.063073836009959 0.03691074668187122
		9.1613746176957243 25.011649916336616 1.7396485741064978
		9.1613746176957243 24.960225996663272 3.4423864015311247
		9.1613746176957243 23.823438914778155 4.920533494246456
		9.1613746176957243 22.190963575769022 5.4073444691528803
		9.1613746176957243 22.270394166583667 5.6737075553611751
		9.1613746176957243 22.349824757398306 5.9400706415694673
		9.1613746176957243 22.429255348212934 6.2064337277777657
		9.1613746176957243 21.936911992868765 5.8856868091790018
		9.1613746176957243 21.444568637524583 5.5649398905802379
		9.1613746176957243 20.952225282180404 5.2441929719814722
		9.1613746176957243 21.223544384822983 4.82375565069629
		9.1613746176957243 21.494863487465565 4.4033183294110971
		9.1613746176957243 21.766182590108137 3.9828810081259096
		9.1613746176957243 21.845613180922776 4.2492440943342062
		9.1613746176957243 21.925043771737418 4.5156071805425011
		9.1613746176957243 22.004474362552049 4.7819702667507977
		;
createNode nurbsCurve -n "Body_ctrlShape" -p "Body_ctrl";
	rename -uid "B53866C4-4317-93E3-CF72-27B1C8F45A6C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.81999999 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 1 2 3 4 5 6 7 8 9 10
		11
		0 42.883754688614843 -35.435487306653251
		-4.6817279999999997 48.248234688614851 -35.435487306653251
		-1.5605760000000002 48.248234688614851 -35.435487306653251
		-1.5605760000000002 57.026474688614833 -35.435487306653251
		-4.6817279999999997 57.026474688614833 -35.435487306653251
		0 62.390954688614841 -35.435487306653251
		4.6817279999999997 57.026474688614833 -35.435487306653251
		1.5605760000000002 57.026474688614833 -35.435487306653251
		1.5605760000000002 48.248234688614851 -35.435487306653251
		4.6817279999999997 48.248234688614851 -35.435487306653251
		0 42.883754688614843 -35.435487306653251
		;
createNode transform -n "Rear_Wheel_follow" -p "Stoppie_ctrl";
	rename -uid "0D2BC36E-4699-E8A3-8AA9-C2895500EFF6";
	setAttr ".t" -type "double3" -0.16914549469947815 2.0354326720752169 -147.506103515625 ;
createNode transform -n "Rear_WheelBump_ctrl_offset" -p "Rear_Wheel_follow";
	rename -uid "4DC78404-43EF-A964-E7D4-ADB5798DCB35";
	setAttr ".r" -type "double3" 0.26163965332794403 0 0 ;
createNode transform -n "Rear_WheelBump_ctrl" -p "Rear_WheelBump_ctrl_offset";
	rename -uid "3616873E-4D3A-472B-E5A7-E2A13966B3BC";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Rear_Wheel_ctrl_offset" -p "Rear_WheelBump_ctrl";
	rename -uid "E8693D89-47EC-B579-2DAA-A2B458126DE2";
createNode transform -n "Rear_Wheel_ctrl" -p "Rear_Wheel_ctrl_offset";
	rename -uid "F43F3213-4B6C-3144-7150-77B802BDD79B";
	addAttr -ci true -k true -sn "autoRoll" -ln "autoRoll" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".autoRoll";
createNode nurbsCurve -n "Rear_Wheel_ctrlShape" -p "Rear_Wheel_ctrl";
	rename -uid "4D9318B8-42FE-CA64-DDDF-D487FD03D399";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.8415440126589369e-15 -30.0740786334391 30.075313454239819
		-4.7840885717586523e-31 -42.532043029446228 0.00087315016175193146
		1.8415440126589362e-15 -30.075313454239826 -30.074078633439093
		2.6043365184092402e-15 -0.00087315016175149561 -42.532043029446243
		1.8415440126589362e-15 30.0740786334391 -30.075313454239819
		5.7981740835360004e-31 42.53204302944625 -0.00087315016175358801
		-1.8415440126589362e-15 30.075313454239826 30.074078633439093
		-2.6043365184092402e-15 0.00087315016175509082 42.532043029446243
		-1.8415440126589369e-15 -30.0740786334391 30.075313454239819
		-4.7840885717586523e-31 -42.532043029446228 0.00087315016175193146
		1.8415440126589362e-15 -30.075313454239826 -30.074078633439093
		;
createNode nurbsCurve -n "Rear_Wheel_ctrlShape1" -p "Rear_Wheel_ctrl";
	rename -uid "F94C9CEE-4229-E5A1-41DC-A3B2DAACC6D6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		1.135468457591493e-09 49.85838290699963 5.0372346317148535
		1.135468457591493e-09 41.132014458958864 -0.00084547214180114689
		1.135468457591493e-09 49.858176043817735 -5.0392838630293459
		1.135468457591493e-09 49.85838290699963 5.0372346317148535
		;
createNode nurbsCurve -n "Rear_WheelBump_ctrlShape" -p "Rear_WheelBump_ctrl";
	rename -uid "F5279A2F-4B67-63F7-90E1-3786A394BB56";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 1 2 3 4 5 6 7 8 9 10
		11
		28.956 -7.6199999983942792 0.00015643274475392102
		25.298400000000001 -3.4289999992774258 7.0394735139264462e-05
		27.736799999999999 -3.4289999992774258 7.0394735139264462e-05
		27.736799999999999 3.4289999992774258 -7.0394735139264462e-05
		25.298400000000001 3.4289999992774258 -7.0394735139264462e-05
		28.956 7.6199999983942792 -0.00015643274475392102
		32.613599999999998 3.4289999992774258 -7.0394735139264462e-05
		30.1752 3.4289999992774258 -7.0394735139264462e-05
		30.1752 -3.4289999992774258 7.0394735139264462e-05
		32.613599999999998 -3.4289999992774258 7.0394735139264462e-05
		28.956 -7.6199999983942792 0.00015643274475392102
		;
createNode transform -n "Front_Wheel_steer_offset" -p "Stoppie_ctrl";
	rename -uid "F6D03630-4406-A1FD-C5AA-6E83F87F34FF";
	setAttr ".t" -type "double3" -0.0055175120544433591 61.642160855668969 -29.675088493465609 ;
	setAttr ".r" -type "double3" 90.000003877008822 -23.342616686872294 -90.000009784779422 ;
createNode transform -n "Front_Wheel_steer" -p "Front_Wheel_steer_offset";
	rename -uid "7504F40F-45DD-F317-FDB1-13A078415D19";
createNode transform -n "Front_Wheel_follow" -p "Front_Wheel_steer";
	rename -uid "79B032DC-4FED-74C2-6311-009E874BB827";
createNode transform -n "Front_WheelBump_pos" -p "Front_Wheel_follow";
	rename -uid "67375627-4002-5896-9B01-6F913A6DACAA";
createNode transform -n "Front_WheelBump_orient" -p "Front_WheelBump_pos";
	rename -uid "18635FD4-4C50-CB13-FEE9-F589594AD084";
createNode transform -n "Front_WheelBump_ctrl_offset" -p "Front_WheelBump_orient";
	rename -uid "08E701DC-4121-8EE2-4688-C6AD07F1D9BA";
	setAttr ".t" -type "double3" -1.021405182655144e-14 -2.8421709430404007e-14 -8.6736173798840355e-19 ;
	setAttr ".r" -type "double3" -89.99999943676363 89.999991016085986 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999989 ;
createNode transform -n "Front_WheelBump_ctrl" -p "Front_WheelBump_ctrl_offset";
	rename -uid "71E7477D-4ADB-49B2-E606-EC8ABF1723E6";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "Front_Wheel_ctrl_offset" -p "Front_WheelBump_ctrl";
	rename -uid "CFE35B74-4396-C385-38B9-589CE123D3BF";
	setAttr ".r" -type "double3" 1.8079360196813586e-28 7.1193661683702526e-06 1.6497195786410841e-05 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
createNode transform -n "Front_Wheel_ctrl" -p "Front_Wheel_ctrl_offset";
	rename -uid "860A46F7-4E5C-FC3F-9069-68B5F263E867";
	addAttr -ci true -k true -sn "autoRoll" -ln "autoRoll" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".autoRoll";
createNode nurbsCurve -n "Front_Wheel_ctrlShape" -p "Front_Wheel_ctrl";
	rename -uid "709D671C-4A9A-B821-0BE2-93B11FED8D43";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-2.9650343375347526e-06 -30.074696050179522 30.074696050174193
		-6.954886983029924e-06 -42.532043038408204 -3.7697912676919338e-12
		-6.8706611586382665e-06 -30.074696050173554 -30.074696050179536
		-2.7616952099863551e-06 4.2140592377393156e-12 -42.532043038408688
		2.9650343375347526e-06 30.074696050179522 -30.074696050174193
		6.9548869830299274e-06 42.532043038408226 3.7681351403701917e-12
		6.8706611586382665e-06 30.074696050173554 30.074696050179536
		2.7616952099863559e-06 -4.2104640266689965e-12 42.532043038408688
		-2.9650343375347526e-06 -30.074696050179522 30.074696050174193
		-6.954886983029924e-06 -42.532043038408204 -3.7697912676919338e-12
		-6.8706611586382665e-06 -30.074696050173554 -30.074696050179536
		;
createNode nurbsCurve -n "Front_Wheel_ctrlShape1" -p "Front_Wheel_ctrl";
	rename -uid "4671DB1C-497D-8174-37C3-EAB1F49289D9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		6.8004345017630359e-06 47.344703227602032 4.4543527301267822
		5.2496494895268892e-06 39.629768750269477 2.570003092097713e-06
		6.221973810311872e-06 47.344703227602913 -4.4543475901192311
		6.8004345017630359e-06 47.344703227602032 4.4543527301267822
		;
createNode nurbsCurve -n "Front_WheelBump_ctrlShape" -p "Front_WheelBump_ctrl";
	rename -uid "94D3B61B-4938-DE25-1B5B-ABB9F7C1C4C9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.2 0.85000002 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 1 2 3 4 5 6 7 8 9 10
		11
		27.431998179354533 -7.6200065543141982 9.9671081789242532e-06
		23.77439918070846 -3.4290056804057283 8.6381610585180349e-06
		26.212799180708235 -3.4290062630114537 9.5241263658251531e-06
		26.212800819286823 3.4289937369883523 9.5241277412779036e-06
		23.774400819287049 3.4289943195940777 8.6381624339707855e-06
		27.432001820640291 7.6199934456853704 9.9671112354859234e-06
		31.08960081928636 3.428992571776901 1.1296058355892142e-05
		28.651200819286593 3.4289931543826264 1.0410093048585023e-05
		28.651199180708005 -3.4290068456171796 1.0410091673132273e-05
		31.089599180707772 -3.4290074282229051 1.1296056980439391e-05
		27.431998179354533 -7.6200065543141982 9.9671081789242532e-06
		;
createNode transform -n "BodyNZ_offset" -p "Stoppie_ctrl";
	rename -uid "B4E39D45-425E-CB02-F6A7-8C8EA6A70358";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 24.678121085932062 -64.275399899568185 ;
createNode transform -n "BodyNZ" -p "BodyNZ_offset";
	rename -uid "22715AE8-462F-8F91-4EFE-3A9BA03F741E";
createNode transform -n "BodyNZ_fork" -p "BodyNZ";
	rename -uid "AE29E5E0-49BD-E052-4622-0189DF6522FD";
	setAttr ".t" -type "double3" -0.0055175120544433591 36.964039769736907 34.600311406102577 ;
	setAttr ".r" -type "double3" 90.000003877008822 -23.342616686872294 -90.000009784779422 ;
createNode transform -n "BodyNZ_pivot" -p "BodyNZ";
	rename -uid "A60ED8D2-4441-EFAA-CB2C-449E6523DD59";
	setAttr ".t" -type "double3" -0.16914548950195313 -22.397925679481858 -29.630711259913056 ;
createNode nurbsCurve -n "Stoppie_ctrlShape" -p "Stoppie_ctrl";
	rename -uid "F1C1EFBD-447E-E147-EBDA-20843A834C0D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.75 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		0 -9.8330084163119835 51.494174892635897
		0 -8.4283274605517207 55.732937308138553
		0 -4.4654490706482601 58.59449231641959
		0 0 58.59449231641959
		0 4.4654490706482601 58.59449231641959
		0 8.4283274605517207 55.732937308138553
		0 9.8330084163119835 51.494174892635897
		0 9.0045864618241627 51.219644633863467
		0 8.1761645073363329 50.945114375091052
		0 7.347742552848505 50.670584116318636
		0 8.6929537291628343 49.858929438208882
		0 10.038164905477162 49.047274760099135
		0 11.383376081791489 48.235620081989381
		0 12.34333903970415 49.811185045378892
		0 13.303301997616797 51.386750008768409
		0 14.26326495552947 52.962314972157962
		0 13.434843001041649 52.687784713385533
		0 12.606421046553828 52.413254454613103
		0 11.777999092066011 52.138724195840688
		0 10.095469156045473 57.215923133091131
		0 5.3487247109962635 60.643500011142052
		0 0 60.643500011142052
		0 -5.3487247109962635 60.643500011142052
		0 -10.095469156045473 57.215923133091131
		0 -11.777999092066011 52.138724195840688
		0 -12.606421046553828 52.413254454613103
		0 -13.434843001041649 52.687784713385533
		0 -14.26326495552947 52.962314972157962
		0 -13.303301997616797 51.386750008768409
		0 -12.34333903970415 49.811185045378892
		0 -11.383376081791489 48.235620081989381
		0 -10.038164905477162 49.047274760099135
		0 -8.6929537291628343 49.858929438208882
		0 -7.347742552848505 50.670584116318636
		0 -8.1761645073363329 50.945114375091052
		0 -9.0045864618241627 51.219644633863467
		0 -9.8330084163119835 51.494174892635897
		;
createNode nurbsCurve -n "Wheelie_ctrlShape" -p "Wheelie_ctrl";
	rename -uid "EB7BF267-43D1-5795-21F9-809DAE8B7C48";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.75 0.44999999 1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 34 0 no 3
		39 0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9 10 10 10 11
		 11 11 12 12 12
		37
		0 8.2885635964393352 -48.735920812316515
		0 7.1045121910513531 -52.308911942153017
		0 3.764072707120798 -54.721010016990569
		0 0 -54.721010016990569
		0 -3.764072707120798 -54.721010016990569
		0 -7.1045121910513531 -52.308911942153017
		0 -8.2885635964393352 -48.735920812316515
		0 -7.5902597036990294 -48.504510300635538
		0 -6.8919558109587147 -48.273099788954561
		0 -6.1936519182184062 -48.041689277273576
		0 -7.3275743063072509 -47.357519068825475
		0 -8.4614966943961072 -46.673348860377367
		0 -9.5954190824849555 -45.989178651929251
		0 -10.404603178543057 -47.317273762446163
		0 -11.213787274601176 -48.645368872963118
		0 -12.022971370659262 -49.97346398348003
		0 -11.324667477918942 -49.742053471799046
		0 -10.626363585178638 -49.510642960118055
		0 -9.9280596924383264 -49.279232448437064
		0 -8.5098003167538128 -53.558969076483017
		0 -4.5086145612765609 -56.448185451837837
		0 0 -56.448185451837837
		0 4.5086145612765609 -56.448185451837837
		0 8.5098003167538128 -53.558969076483017
		0 9.9280596924383264 -49.279232448437064
		0 10.626363585178638 -49.510642960118055
		0 11.324667477918942 -49.742053471799046
		0 12.022971370659262 -49.97346398348003
		0 11.213787274601176 -48.645368872963118
		0 10.404603178543057 -47.317273762446163
		0 9.5954190824849555 -45.989178651929251
		0 8.4614966943961072 -46.673348860377367
		0 7.3275743063072509 -47.357519068825475
		0 6.1936519182184062 -48.041689277273576
		0 6.8919558109587147 -48.273099788954561
		0 7.5902597036990294 -48.504510300635538
		0 8.2885635964393352 -48.735920812316515
		;
createNode nurbsCurve -n "COG_ctrlShape" -p "COG_ctrl";
	rename -uid "6F81304E-488B-CE33-14EC-C59609666029";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-63.203327999999999 0 0
		63.203327999999999 0 0
		;
createNode nurbsCurve -n "COG_ctrlShape1" -p "COG_ctrl";
	rename -uid "402CF256-462B-DF04-7A55-7D8B7D7C549E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -63.203327999999999 0
		0 63.203327999999999 0
		;
createNode nurbsCurve -n "COG_ctrlShape2" -p "COG_ctrl";
	rename -uid "C23FE779-472F-4620-FD1F-38A08CF2D1C5";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.5 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -63.203327999999999
		0 0 63.203327999999999
		;
createNode nurbsCurve -n "Drive_ctrlShape" -p "Drive_ctrl";
	rename -uid "B296B28E-4173-6088-A5C7-CCA627B69979";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.34999999 0.94999999 0.34999999 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 1 2 3 4 5 6 7 8 9 10 11 12
		13
		-10.753343999999998 0 10.753343999999998
		-43.013375999999994 0 10.753343999999998
		-43.013375999999994 0 -10.753343999999998
		-10.753343999999998 0 -10.753343999999998
		-10.753343999999998 0 -43.013375999999994
		10.753343999999998 0 -43.013375999999994
		10.753343999999998 0 -10.753343999999998
		43.013375999999994 0 -10.753343999999998
		43.013375999999994 0 10.753343999999998
		10.753343999999998 0 10.753343999999998
		10.753343999999998 0 43.013375999999994
		-10.753343999999998 0 43.013375999999994
		-10.753343999999998 0 10.753343999999998
		;
createNode nurbsCurve -n "Root_ctrlShape" -p "Root_ctrl";
	rename -uid "1EA62882-4C5F-D1EE-4EF7-ADA39CE283BB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.81999999 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		91.287913056976279 5.5897725263033959e-15 -91.287913056976279
		7.9051321172787757e-15 7.9051321172787757e-15 -129.10060472591178
		-91.287913056976279 5.5897725263033951e-15 -91.287913056976279
		-129.10060472591184 4.0980344490145554e-31 -6.6925981464496797e-15
		-91.287913056976279 -5.5897725263033951e-15 91.287913056976279
		-1.2932095871341087e-14 -7.905132117278782e-15 129.10060472591184
		91.287913056976279 -5.5897725263033951e-15 91.287913056976279
		129.10060472591184 -1.0780200757064344e-30 1.7605403883911571e-14
		91.287913056976279 5.5897725263033959e-15 -91.287913056976279
		7.9051321172787757e-15 7.9051321172787757e-15 -129.10060472591178
		-91.287913056976279 5.5897725263033951e-15 -91.287913056976279
		;
createNode nurbsCurve -n "Root_ctrlShape1" -p "Root_ctrl";
	rename -uid "AA46387C-4F57-CB12-BEC2-5297D9D1738E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 0.81999999 0.1 ;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-12.117290714306412 0 120.74975744664043
		0 0 144.98433887525326
		12.117290714306412 0 120.74975744664043
		-12.117290714306412 0 120.74975744664043
		;
createNode transform -n "BikeRig_skel" -p "BikeRig";
	rename -uid "3E602AF4-4380-DD77-81D9-08993E73654E";
createNode joint -n "bike_root_jnt" -p "BikeRig_skel";
	rename -uid "C9C9F925-4F30-B849-1448-18A41381F1BB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_body_jnt" -p "bike_root_jnt";
	rename -uid "42B08E3A-469C-0499-AFDB-5B8C89DCB7A0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_steer_jnt" -p "bike_body_jnt";
	rename -uid "8EEE9B89-4D06-1094-1966-26BBADCF1BA8";
	setAttr ".t" -type "double3" -0.0055175120544433591 36.964039769736907 34.600311406102577 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000003877008822 -23.342616686872294 -90.000009784779422 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_forkSlide_jnt" -p "bike_steer_jnt";
	rename -uid "B07ADE12-4DAA-586A-97AE-AF8B51A6B5E8";
	setAttr ".t" -type "double3" 68.354988098144531 2.8218563927487423 1.0254854081398826e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_wheelF_jnt" -p "bike_forkSlide_jnt";
	rename -uid "80DD6796-4CEE-BA71-BCBE-B281105A6654";
	setAttr ".t" -type "double3" -8.6696116952111879e-10 -1.4210854715202004e-14 -0.0055292555249160302 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -66.657383313127397 89.999991016085986 0 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_L_lever_jnt" -p "bike_steer_jnt";
	rename -uid "3D91CF78-4956-5028-BE71-A8B49FE35E18";
	setAttr ".t" -type "double3" 7.407931557057978 4.4836596181051078 -16.920687120875645 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -118.54594442118882 61.667982027497196 -68.385331133645408 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_R_lever_jnt" -p "bike_steer_jnt";
	rename -uid "B355B029-4433-57A4-4192-F89E4451025A";
	setAttr ".t" -type "double3" 7.4079309646204337 4.4836459534222683 16.909640471898314 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -60.580631781233805 -61.668001787752154 -68.385319914179149 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_L_mirror_jnt" -p "bike_steer_jnt";
	rename -uid "E09117CE-4CAC-9686-08F5-F68601F5DDFF";
	setAttr ".t" -type "double3" 4.5669375024445316 -6.77542633105395 -32.580032241817392 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 16.269924889786548 121.60258541494609 83.881634531779284 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_R_mirror_jnt" -p "bike_steer_jnt";
	rename -uid "85FC6AD3-4515-A21F-5DA7-C2ACA9072BF4";
	setAttr ".t" -type "double3" 4.5669418207458676 -6.7754399957368179 32.569006947635863 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -16.27000996669177 -58.397366452698435 -96.11826409317203 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_swingarm_jnt" -p "bike_body_jnt";
	rename -uid "B95A0F07-46D7-7040-3C89-669FA4DCB06D";
	setAttr ".t" -type "double3" -0.16914548950195313 -22.397925679481858 -29.63071125991306 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_wheelR_jnt" -p "bike_swingarm_jnt";
	rename -uid "2D8A4024-4025-338C-83F2-99AE3F51C92C";
	setAttr ".t" -type "double3" 0.16914548950195313 -0.24476273437498719 -53.599574853515577 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_shockBottom_jnt" -p "bike_swingarm_jnt";
	rename -uid "583091C5-4E59-10F0-7B9C-0288F2D30432";
	setAttr ".t" -type "double3" 0.16914548950195313 22.385160146484374 -16.263251030273441 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999986093370325 -57.764026068215877 90.000016440847887 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_shockTop_jnt" -p "bike_body_jnt";
	rename -uid "E653E114-4EC4-5379-1C9E-D08AFD8DD520";
	setAttr ".t" -type "double3" -3.720703125e-06 12.953754633018143 -25.332119687647435 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999986093370325 57.764026068215877 -89.999983559152113 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_L_pedal_jnt" -p "bike_body_jnt";
	rename -uid "41D8CDE9-420F-67B4-68F3-D0835CE4BEA3";
	setAttr ".t" -type "double3" 14.713178203125 -36.090909409950598 -16.781738337549779 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 83.389718807201035 59.738003974142302 84.284072252824345 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_R_pedal_jnt" -p "bike_body_jnt";
	rename -uid "47902A1A-4716-82EC-0CB3-038E1561C4E6";
	setAttr ".t" -type "double3" -15.468425126953125 -29.217332686317789 -14.266321875757786 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 99.148408727952088 79.405507829179754 98.995027466695248 ;
	setAttr ".radi" 0.11998575357340145;
createNode joint -n "bike_L_stand_jnt" -p "bike_body_jnt";
	rename -uid "751AD33A-4613-0FDD-0138-098B9D2368D9";
	setAttr ".t" -type "double3" 14.243283164062493 -32.555882393349009 -30.684125100245083 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -92.460391090154417 -5.6390977874857988 7.3937268901944835 ;
	setAttr ".radi" 0.11998575357340145;
createNode transform -n "RigSystem" -p "BikeRig";
	rename -uid "476696EB-48A5-AEAD-0423-DCA10215BCC2";
	setAttr ".v" no;
createNode transform -n "Constraints" -p "RigSystem";
	rename -uid "AF38D4B7-493D-0792-94A7-4BADCB0B39AC";
createNode parentConstraint -n "bike_root_pc" -p "Constraints";
	rename -uid "B3AAE81E-4C69-215D-AEAA-5B9DF3EADAEF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Drive_ctrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 -8.2296000000000014 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "bike_body_pc" -p "Constraints";
	rename -uid "5D8DBD68-44E5-E160-5B31-91A3AE13A484";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Body_ctrlW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 57.146063493203329 17.14748730665325 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 -7.1054273576010019e-15 3.5527136788005009e-15 ;
	setAttr ".rst" -type "double3" 0 57.146063493203329 17.14748730665325 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "bike_swingarm_aim" -p "Constraints";
	rename -uid "4632D890-48A8-E38E-47CF-D281201947F7";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Rear_Wheel_ctrlW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.16914548950195313 34.74813781372147 -12.483223953259809 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".wut" 2;
	setAttr ".o" -type "double3" 0.2616376153835252 0 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "bike_shockTop_aim" -p "Constraints";
	rename -uid "B51664F3-421D-B6F4-4C6A-7BB7CB5B5249";
	addAttr -dcb 0 -ci true -sn "w0" -ln "bike_shockBottom_jntW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -3.720703125e-06 70.099818126221464 -8.1846323809941843 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" -89.999986093370325 57.764026068215877 -89.999983559152113 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 4.4527765540487651e-14 -5.7965609069672948e-13 3.6576378836830631e-13 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "bike_shockBottom_aim" -p "Constraints";
	rename -uid "65B85D86-4D23-95FE-B179-F9814FA05ED2";
	addAttr -dcb 0 -ci true -sn "w0" -ln "bike_shockTop_jntW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 57.133297960205844 -28.74647498353325 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 89.999986093370325 -57.764026068215877 90.000016440847887 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -2.2263882770246416e-14 5.7886095202636335e-13 -3.3077768687220774e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "rootJnt_pc" -p "Constraints";
	rename -uid "7CB6E6FA-46B6-CEA5-A783-C3BD16691A25";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_root_jntW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode parentConstraint -n "bodyJnt_pc" -p "Constraints";
	rename -uid "2DBBA38E-454B-ED7E-CDD1-15A69A8F7F92";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_body_jntW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 57.146063493203336 17.14748730665325 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 7.1054273576010019e-15 0 ;
	setAttr ".rst" -type "double3" 0 57.146063493203336 17.14748730665325 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "steerJnt_pc" -p "Constraints";
	rename -uid "9E456374-4307-888B-C90F-B2BB98461DD4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_steer_jntW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.0055175120544433591 94.110103262940243 51.747798712755824 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 90.000024694787896 -23.34261668687229 -90.000009784779408 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000022328519 1.0000000022329056 1.0000000000000782 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tor" -type "double3" 2.0817779089030103e-05 1.2722215313489094e-14 
		-3.1805546814635176e-15 ;
	setAttr ".lr" -type "double3" -3.1805546814635183e-15 -1.9083328088781101e-14 6.3611093629270335e-15 ;
	setAttr ".rst" -type "double3" -0.0055175120544433591 36.964039769736907 34.600311406102577 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635183e-15 -1.9083328088781101e-14 
		6.3611093629270335e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "Front_Piston1Jnt_pc" -p "Constraints";
	rename -uid "46E47DEE-43A1-66F8-EEF9-12BC79FBE7AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_forkSlide_jntW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.0055292555249160961 32.467942407271266 81.422887206221432 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 90.000024694787655 -23.342616123635882 -90.000009784779138 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999042432142 0.9999999904243756 1.0000000000000786 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.9211289458430656e-06 1.4210854715202004e-14 
		-1.7347234759768071e-18 ;
	setAttr ".tg[0].tor" -type "double3" 2.0817778957415427e-05 0 0 ;
	setAttr ".lr" -type "double3" 1.9934487479120944e-13 0 0 ;
	setAttr ".rst" -type "double3" 36.407498986869378 2.8218577930914961 2.9126659244205211e-10 ;
	setAttr ".rsrr" -type "double3" 1.9934487479120944e-13 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "Rear_ForkJnt_pc" -p "Constraints";
	rename -uid "3E606F5B-48AB-8D26-F1C7-F98D5C4D6002";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_swingarm_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -0.16914548950195313 34.748137813721485 -12.483223953259813 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 1.4210854715202004e-14 -5.3290705182007514e-15 ;
	setAttr ".rst" -type "double3" -0.16914548950195313 -22.397925679481851 -29.630711259913063 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "Rear_PistonJnt_pc" -p "Constraints";
	rename -uid "418B9813-48B3-7696-7939-DC90E7C32E41";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_shockTop_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -3.7207031250000009e-06 70.099818126221479 -8.1846323809941843 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" -89.999980563120062 57.764026068216218 -89.999983559151048 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000164069904 1.0000000164069833 1.000000000000016 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -7.1054273576010019e-15 1.4210854715202004e-14 
		1.0587911840678754e-22 ;
	setAttr ".tg[0].tor" -type "double3" 5.5302493486005767e-06 -5.6613873481711261e-13 
		3.4668046027952332e-13 ;
	setAttr ".lr" -type "double3" -1.5902773407319275e-14 5.7488525867453057e-13 -3.3713879623513291e-13 ;
	setAttr ".rst" -type "double3" -3.7207031250000009e-06 12.953754633018143 -25.332119687647435 ;
	setAttr ".rsrr" -type "double3" -3.1805546814651777e-15 5.6454845595977418e-13 -3.3713879623513276e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "Rear_Piston2Jnt_pc" -p "Constraints";
	rename -uid "CE32298B-4174-5E55-8471-8E8732A8A9DD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_shockBottom_jntW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 0 57.133297960205851 -28.746474983533258 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" -90.000019436878148 -57.764026068216232 90.000016440846849 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000164069902 1.0000000164069833 1.000000000000016 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.6645352591003757e-15 -7.1054273576010019e-15 
		2.1175823681357508e-22 ;
	setAttr ".tg[0].tor" -type "double3" 179.99999446975067 -5.5977762469588219e-13 
		3.594026790053773e-13 ;
	setAttr ".lr" -type "double3" 3.1805546814633495e-14 -5.5341651457465196e-13 3.4668046027952322e-13 ;
	setAttr ".rst" -type "double3" 0.16914548950195313 22.385160146484367 -16.263251030273445 ;
	setAttr ".rsrr" -type "double3" 9.5416640443888022e-15 -5.677290106412377e-13 3.5304156964245036e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_BrakeJnt_pc" -p "Constraints";
	rename -uid "5005E293-4AA3-1E36-6825-71A1B4D3035B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_L_lever_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 16.915168447265632 89.085048126221466 58.799714318224559 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 12.851061310729932 19.622949571924369 -20.855012384872747 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999498163383 1.0000000072063344 1.0000000146025894 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.4210854715202004e-14 2.8421709430404007e-14 
		1.4210854715202004e-14 ;
	setAttr ".tg[0].tor" -type "double3" 1.2093636983245922e-08 -2.5538014154113639e-08 
		4.6944048858381874e-08 ;
	setAttr ".lr" -type "double3" 1.5902773407317578e-14 1.2324649390671127e-13 -6.361109362927017e-15 ;
	setAttr ".rst" -type "double3" 7.4079315405171471 4.4836534601513023 -16.920688749960657 ;
	setAttr ".rsrr" -type "double3" 1.5902773407317578e-14 1.2324649390671127e-13 -6.361109362927017e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_BrakeJnt_pc" -p "Constraints";
	rename -uid "49E45C4F-4B17-43EC-A2E3-B3815B39165F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_R_lever_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -16.915159145507836 89.08504812622148 58.799699435412073 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 168.0223710235598 19.622939163769157 -159.14501520764037 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000148882664 0.99999997946892272 0.99999997545983621 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 -2.8421709430404007e-14 -3.5527136788005009e-15 ;
	setAttr ".tg[0].tor" -type "double3" 179.99999998767348 -2.6250375708697995e-08 
		-4.654926568890123e-08 ;
	setAttr ".lr" -type "double3" -1.2326575216530755e-08 6.9972202990828847e-14 -1.2722218733380953e-14 ;
	setAttr ".rst" -type "double3" 7.4079309480795885 4.4836520873386831 16.909638842813404 ;
	setAttr ".rsrr" -type "double3" -1.2326575216530755e-08 6.9972202990828847e-14 -1.2722218733380953e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_Mirror2Jnt_pc" -p "Constraints";
	rename -uid "90AAE308-4835-B7D4-A340-6BB3C0B8CEF6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_L_mirror_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 32.57451401367188 87.232338887940259 47.336480997912076 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" -3.4533430417748621 20.721036957976825 -9.6789201117111272 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999804022588 0.99999997568699805 0.99999999833468722 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.7763568394002505e-15 4.2632564145606011e-14 
		1.4210854715202004e-14 ;
	setAttr ".tg[0].tor" -type "double3" -5.910372695346991e-07 -9.3318271874033396 
		-1.0135222022018623e-06 ;
	setAttr ".lr" -type "double3" -6.0752940374701497e-08 -3.0711328157275028e-07 4.9291770756884556e-07 ;
	setAttr ".rst" -type "double3" 3.6455966968490543 -0.028728516239219459 0.025137161892117454 ;
	setAttr ".rsrr" -type "double3" -6.0752940374701484e-08 -3.0711328276545827e-07 
		4.9291769882232014e-07 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_Mirror2Jnt_pc" -p "Constraints";
	rename -uid "80E9F449-46DB-A236-9AF8-228D491AD6D4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_R_mirror_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -32.574525175781261 87.232338887940216 47.336466115099576 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 3.4533825045178563 159.27884896073402 9.6789789066779637 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999230591352 0.99999999967821029 1.0000000342743767 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.7763568394002505e-14 -1.4210854715202004e-14 
		1.4210854715202004e-14 ;
	setAttr ".tg[0].tor" -type "double3" 179.99999971153667 -9.331747776182743 -2.4460482459124237e-07 ;
	setAttr ".lr" -type "double3" -4.2008818446812676e-07 3.2202912922819861e-07 -1.8840343529863683e-07 ;
	setAttr ".rst" -type "double3" 3.6455881810149577 -0.028736917659301753 -0.02508382405624765 ;
	setAttr ".rsrr" -type "double3" -4.2008817810701743e-07 3.220291097473012e-07 -1.8840343291322077e-07 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_Pedal_1_pc" -p "Constraints";
	rename -uid "4914FFF4-4138-5148-7DE6-2686F43AB8DC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_L_pedal_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 14.713178203125 21.055154083252738 0.36574896910347121 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 83.389718807201049 59.738003974142323 84.284072252824458 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.99999999392599492 0.99999999390801875 0.99999998130306256 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 5.3290705182007514e-15 7.1054273576010019e-15 
		0 ;
	setAttr ".tg[0].tor" -type "double3" -8.8856746413386974e-14 7.0369772327380303e-14 
		-9.5416640443905503e-15 ;
	setAttr ".lr" -type "double3" 9.2236085762441977e-14 -5.0888874903416281e-14 2.067360542951282e-14 ;
	setAttr ".rst" -type "double3" 14.713178203125 -36.090909409950598 -16.781738337549779 ;
	setAttr ".rsrr" -type "double3" 9.2236085762441977e-14 -5.0888874903416281e-14 2.067360542951282e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_Pedal_1_pc" -p "Constraints";
	rename -uid "D6119C29-42F0-6016-6E0C-A9A02D8741DA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_R_pedal_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" -15.468425126953131 27.928730806885543 2.8811654308954626 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 99.14840872795196 79.405507829179697 98.995027466695191 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 0.9999999844339994 1.0000000228250929 0.99999997567523657 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 2.2204460492503131e-15 3.5527136788005009e-15 
		-5.3290705182007514e-15 ;
	setAttr ".tg[0].tor" -type "double3" -6.7686179314895451e-14 5.9635400277440949e-16 
		6.0430538947806828e-14 ;
	setAttr ".lr" -type "double3" 6.8381925651465628e-14 -6.2617170291312654e-15 -5.8045122936709188e-14 ;
	setAttr ".rst" -type "double3" -15.468425126953131 -29.217332686317793 -14.266321875757788 ;
	setAttr ".rsrr" -type "double3" 6.8381925651465628e-14 -6.2617170291312654e-15 -5.8045122936709188e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "standJnt_pc" -p "Constraints";
	rename -uid "D931131D-4761-6B92-7CC4-3DB07D56DD7D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "bike_L_stand_jntW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr ".t" -type "double3" 14.243283164062495 24.590181099854327 -13.536637793591833 ;
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" -0.73054270961979795 -5.6390977874857997 7.3937268901944799 ;
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr ".s" -type "double3" 1.0000000076664994 0.9999999834327874 1.0000000081583325 ;
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 1.7763568394002505e-15 -1.7763568394002505e-15 
		3.5527136788005009e-15 ;
	setAttr ".tg[0].tor" -type "double3" 91.729848380534634 5.0193128566846126e-15 -7.9513867036587919e-16 ;
	setAttr ".lr" -type "double3" 1.6151254241806915e-14 2.1555712391949992e-15 5.593924786441203e-15 ;
	setAttr ".rst" -type "double3" 14.243283164062495 -32.555882393349009 -30.684125100245083 ;
	setAttr ".rsrr" -type "double3" 1.6151254241806915e-14 2.1555712391949992e-15 5.593924786441203e-15 ;
	setAttr -k on ".w0";
createNode transform -n "Front_wheelRoll_piv" -p "RigSystem";
	rename -uid "8B9C35EE-427E-CCAB-B3DF-699A22297FE2";
	setAttr ".it" no;
createNode transform -n "Rear_wheelRoll_piv" -p "RigSystem";
	rename -uid "8F9E6788-41BA-A202-221E-4CB1D03D6ABF";
	setAttr ".it" no;
createNode transform -n "Skeleton";
	rename -uid "8C75F21C-4B8E-F798-A9C9-EE94DEBEFE34";
createNode joint -n "rootJnt" -p "Skeleton";
	rename -uid "89F21E0A-447F-BF94-FA20-00970D59EDE7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "rootJnt";
	setAttr ".radi" 3.048;
createNode joint -n "bodyJnt" -p "rootJnt";
	rename -uid "EBE23C1E-4383-FFBC-CDB8-9AA1E25CC4C4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 57.146063493203336 17.14748730665325 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "bodyJnt";
	setAttr ".radi" 3.048;
createNode joint -n "steerJnt" -p "bodyJnt";
	rename -uid "05B6DBA5-4565-D528-4AF1-36837B35D775";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".s" -type "double3" 1.0000000022328519 1.0000000022329056 1.0000000000000782 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000024694787896 -23.34261668687229 -90.000009784779408 ;
	setAttr ".bps" -type "matrix" -1.567988793420015e-07 -0.918151922020363 0.39622853576691391 0
		 -3.6333878892320103e-07 0.39622853576696626 0.91815192202034046 0 -1 -3.8857805861883508e-15 -3.9572839605209503e-07 0
		 -0.0055175120544433591 94.110103262940243 51.747798712755824 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "steerJnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_MirrorJnt" -p "steerJnt";
	rename -uid "F39BF077-48F2-C360-05B2-0B8B410E8DA5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.9194126817220685 -9.7356750248912345 -30.481317792939478 ;
	setAttr ".r" -type "double3" -1.9083328088781101e-14 1.5902773407317623e-15 2.3059021440610497e-14 ;
	setAttr ".s" -type "double3" 1.0000000247427516 0.99999999127987471 1.0000000305279557 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 19.048005330029202 35.373316757370056 97.469833719324257 ;
	setAttr ".bps" -type "matrix" 0.5789012332075425 0.4176706604718019 0.70030324221535578 0
		 -0.26611319219044316 0.90859848867137905 -0.32192007996713701 0 -0.77075105108754594 8.3530094359049431e-16 0.63713646756668663 0
		 30.475803046875011 85.735782794190214 44.758193722521433 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "MirrorJnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Mirror1Jnt" -p "L_MirrorJnt";
	rename -uid "FFDB29D4-4131-EEF8-BEC4-0883572AAA2A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 3.5220438823007778 6.7679195581149544e-15 1.4381829060994277e-14 ;
	setAttr ".r" -type "double3" 1.5902773407317584e-15 3.3104297235376201e-32 -2.3854160110976376e-15 ;
	setAttr ".s" -type "double3" 0.99999999893297264 0.9999999941624429 1.0000000069045842 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 50.421378451575329 -24.687613003642557 ;
	setAttr ".bps" -type "matrix" 0.99999999893297276 -5.882978890202243e-16 1.1102230246251565e-16 0
		 6.9388939039072284e-16 0.9999999941624429 -5.5511151231257827e-16 0 5.5511151231257827e-17 4.7668951250373738e-16 1.0000000069045845 0
		 32.514718593749997 87.206837188721451 47.224692472521433 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Mirror2Jnt" -p "L_MirrorJnt";
	rename -uid "03E0D0F2-40C2-01EB-1AE8-398668785732";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".s" -type "double3" 0.99999999804022588 0.99999997568699805 0.999999998334687 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -25.064889283764575 69.400603733283916 -51.235795267852204 ;
	setAttr ".bps" -type "matrix" 0.92200035179034701 -0.15725130064620163 -0.35381828079397754 0
		 0.14681229913006516 0.98755859619800512 -0.05633932262253781 0 0.35827572526626911 -1.0105466731772766e-15 0.93361582107112095 0
		 32.57451401367188 87.232338887940259 47.336480997912076 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror2Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Mirror3Jnt" -p "L_Mirror2Jnt";
	rename -uid "8B493509-4B4C-CCE5-AF2A-039607B0EAC2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.3035248403044071 1.3535839116229909e-14 0 ;
	setAttr ".r" -type "double3" 2.2860236773019022e-15 -2.2263882770244611e-14 -1.5405811738338911e-15 ;
	setAttr ".s" -type "double3" 1.0000000019198108 0.99999998240348509 0.99999997783154349 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.3366354549709132 17.152935537650151 1.1701427376276747 ;
	setAttr ".bps" -type "matrix" 0.77800784726158168 -0.13095524895076385 -0.61445464943416617 0
		 0.10276922890585899 0.99138826311823747 -0.081165030330000693 0 0.61979211039688831 -4.2330146532995658e-15 0.78476601325035689 0
		 33.776364375 87.027357911377749 46.875270079943327 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror3Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Mirror4Jnt" -p "L_Mirror3Jnt";
	rename -uid "7AA7356E-4AF4-38F2-2E5F-DEBA5F65D097";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.85844076598266528 0 6.7679195581149544e-15 ;
	setAttr ".r" -type "double3" 2.4848083448933725e-17 2.3854160110976376e-15 -2.4848083448933725e-17 ;
	setAttr ".s" -type "double3" 1.0000000009282832 0.99999998055429473 1.0000000025350408 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.83083147276905933 -7.0699322419363648 0.80500546271990503 ;
	setAttr ".bps" -type "matrix" 0.84973351868630698 -0.11612408567318519 -0.51426466513277047 0
		 0.099346634232190006 0.99323469451315227 -0.060125277468717375 0 0.51776751134423882 -1.175030336625595e-15 0.85552136692573355 0
		 34.444238027343758 86.914940587159009 46.347797160021457 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror4Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Mirror5Jnt" -p "L_Mirror4Jnt";
	rename -uid "58005A93-4D23-882B-649F-07819BFC9717";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 6.8212199484335043 4.0607517348689725e-14 6.7679195581149544e-15 ;
	setAttr ".s" -type "double3" 0.99999999977034171 0.99999999972526066 1.0000000005043979 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.3235500103254956e-16 -31.18261927422714 6.6684648203772845 ;
	setAttr ".bps" -type "matrix" 0.99999999977034171 -5.3281017611716375e-17 -3.3306690738754696e-16 0
		 8.5063093755893216e-17 0.99999999972526077 1.439319224099268e-15 0 7.2164496600635175e-16 -1.3522082503747802e-15 1.0000000005043979 0
		 40.240457255859397 86.12283265747152 42.83988476744333 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror5Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_MirrorJnt" -p "steerJnt";
	rename -uid "D62F8A6B-419F-40AB-7A24-288D4F562BD1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.9194237131148864 -9.735649462636518 30.470292021502658 ;
	setAttr ".r" -type "double3" -9.5416640443905503e-15 1.9083328088781097e-14 -8.7465253740246703e-15 ;
	setAttr ".s" -type "double3" 1.0000000093575945 1.0000000280962389 1.0000000350206173 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -19.047719498315288 -35.372685558706081 97.469817228416886 ;
	setAttr ".bps" -type "matrix" -0.57889279570538243 0.41767371918325097 0.70030837071909025 0
		 0.26611169302937165 0.90859711311347813 -0.32192531597774937 0 -0.77075790607281769 1.4138295677685101e-16 -0.63712818197555943 0
		 -30.475806767578142 85.735782794190214 44.758197443224567 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "MirrorJnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Mirror1Jnt" -p "R_MirrorJnt";
	rename -uid "3BC87CA0-4531-27C0-128A-AF9CCA3C325C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 3.5220180896414988 -2.0303758674344862e-14 -1.0151879337172431e-14 ;
	setAttr ".r" -type "double3" 1.1034765745125391e-32 -3.975693351829395e-16 -3.180554681463516e-15 ;
	setAttr ".s" -type "double3" 0.99999998342744112 1.0000000032689811 1.0000000133035765 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 50.421994592538724 155.3121937101364 ;
	setAttr ".bps" -type "matrix" 0.99999998342744156 -5.2530565651566266e-16 7.7715611723760958e-16 0
		 1.4744521283915853e-16 1.0000000032689811 -5.7970725851977544e-17 0 -8.3266726846886741e-16 1.3196554382234221e-16 1.0000000133035769 0
		 -32.514677666015636 87.206837188721451 47.224696193224581 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Mirror2Jnt" -p "R_MirrorJnt";
	rename -uid "DD2C8D12-44D2-BE77-6F01-0CAF06C690EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".s" -type "double3" 0.9999999923059133 0.99999999967821018 1.0000000342743762 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 25.065938503140945 -69.40124071191903 -51.236985995491217 ;
	setAttr ".bps" -type "matrix" -0.92199949067780262 -0.15725212742571723 -0.35382014106292159 0
		 -0.14681295870556732 0.98755848809672986 -0.056339924570762076 0 0.35827767171568015 1.0056807981576992e-16 -0.93361511261265795 0
		 -32.574525175781261 87.232338887940216 47.336466115099576 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror2Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Mirror3Jnt" -p "R_Mirror2Jnt";
	rename -uid "62C7A262-45D1-C9DE-6D93-33881225234C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.3035179868031606 -1.3535839116229909e-14 1.3535839116229909e-14 ;
	setAttr ".r" -type "double3" 2.9817700138720464e-15 -1.9114388193092266e-14 2.9817700138720415e-16 ;
	setAttr ".s" -type "double3" 1.0000000029224798 1.0000000220835914 0.9999999798906688 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.3366868729054979 -17.153080695523368 1.1700832515027371 ;
	setAttr ".bps" -type "matrix" -0.77800478774368731 -0.13095692263963676 -0.61445816823085375 0
		 -0.10277016500279121 0.99138808139029222 -0.081166553639772904 0 0.61979579862057177 -6.2563004335198227e-16 -0.78476310297670515 0
		 -33.776368095703127 87.027357911377734 46.875255197130798 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror3Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Mirror4Jnt" -p "R_Mirror3Jnt";
	rename -uid "BF24ADB0-49F5-21ED-5231-B39AD79FEF1D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.85842979472050474 1.3535839116229909e-14 6.7679195581149544e-15 ;
	setAttr ".r" -type "double3" -5.5908187760100887e-17 6.2120208622334312e-18 -7.0195835743237773e-16 ;
	setAttr ".s" -type "double3" 1.0000000118502577 0.9999999802674634 1.0000000226727539 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.8308603354697035 7.070206322753366 0.80512765548454579 ;
	setAttr ".bps" -type "matrix" -0.84973363581428119 -0.1161235798863112 -0.51426460704655341 0
		 -0.099346207086491278 0.99323475351050994 -0.060125003878356773 0 0.51776742673049625 -4.0624989237310315e-15 -0.85552144167308253 0
		 -34.444230585937504 86.914940587158981 46.347785997912041 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror4Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Mirror5Jnt" -p "R_Mirror4Jnt";
	rename -uid "9B4E1759-4C18-C425-4983-81BCEE41E79E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 6.8212496588805465 2.7071678232459817e-14 -1.3535839116229909e-14 ;
	setAttr ".s" -type "double3" 0.99999999741038403 0.99999999957411534 1.0000000030154998 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 211.18261290920393 6.6684355703719627 ;
	setAttr ".bps" -type "matrix" 0.99999999741038437 -7.8835540274814221e-18 1.7208456881689926e-15 0
		 -1.6653345369377348e-16 0.99999999957411567 -4.6629367034256575e-15 0 -1.9984014443252818e-15 4.7731279489361097e-15 1.0000000030155007 0
		 -40.240475859375003 86.12283265747152 42.839858722521413 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Mirror5Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyJnt" -p "steerJnt";
	rename -uid "9C2B55C5-4624-3344-B49E-18AF2A1B89E0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -2.9409309891460813 3.729911786153409 0.032824718553432587 ;
	setAttr ".r" -type "double3" -2.9824979850668399e-16 2.4265706493099369e-19 1.2407055729921694e-16 ;
	setAttr ".s" -type "double3" 0.99999998439790561 0.99999997921334605 1.0000000077940929 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15725447665232181 0.068414828808747774 0.16916353516226076 ;
	setAttr ".bps" -type "matrix" 0.0011939058467012548 -0.9169774027186105 0.39893732125243925 0
		 0.0027442400492504642 0.39893910569029506 0.91697329160901542 0 -0.99999552965154326 7.4269586354804152e-16 0.0029927019757855166 0
		 -0.038343124694823802 98.288222188721477 54.00714359556833 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyJnt";
	setAttr ".radi" 3.048;
createNode joint -n "key1Jnt" -p "keyJnt";
	rename -uid "166B7F11-49B8-BDBA-7726-089C0629371C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 2.8366657998203673 1.3535839116229909e-14 -1.4276080317898732e-15 ;
	setAttr ".r" -type "double3" 4.9934708498977218e-12 -3.180554681462963e-15 -1.2722218725854209e-14 ;
	setAttr ".s" -type "double3" 0.99999997660406115 0.99999999564057529 1.0000000277553636 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.828530552828497 66.488125891945529 ;
	setAttr ".bps" -type "matrix" 0.99999997660406148 -3.0575903897385736e-16 6.1495947223377811e-16 0
		 3.0682921481339775e-16 0.9999999956405754 -1.4604983888943934e-13 0 -6.4748553740834325e-16 1.461075727080759e-13 1.0000000277553636 0
		 -0.034956412811279307 95.687063751221487 55.13879545103709 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "key1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrapJnt" -p "keyJnt";
	rename -uid "C0932C7B-410C-7A81-8348-898F250A9DDC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.59339376092577301 -0.006076266461666968 0.23714920030442141 ;
	setAttr ".r" -type "double3" -2.7829853462805772e-15 -5.5659706925611543e-15 1.3517588037778611e-31 ;
	setAttr ".s" -type "double3" 1.0000000104961004 0.99999997580326305 1.0000000333499568 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 154.81456428924 -15.018349195450018 -52.368368270799387 ;
	setAttr ".bps" -type "matrix" -0.26052221177782203 -0.84591538454824344 -0.46535509059984542 0
		 -0.41322454949263593 0.53331713214711862 -0.73811805279474618 0 0.87256729987544879 -6.7689055240884036e-16 -0.48849398551874107 0
		 -0.27621639587402297 98.829926798096466 53.765554620958952 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrapJnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrap1Jnt" -p "keyStrapJnt";
	rename -uid "E8AA3622-43A7-5EE1-B278-D8ADE1D08D30";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 2.6982018425373284 1.0151879337172431e-14 0 ;
	setAttr ".r" -type "double3" -1.2324649390671127e-14 -1.9083328088781101e-14 2.5842006786891095e-15 ;
	setAttr ".s" -type "double3" 1.0000000281714772 1.0000000058972589 0.99999999777811066 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.4543064241991717 -14.839471468470636 30.708761139372928 ;
	setAttr ".bps" -type "matrix" -0.19702982344035591 -0.43977112194148466 -0.87623094291650361 0
		 -0.096478196356590287 0.89810989345204995 -0.42905779180180914 0 0.97563886985400328 -7.8756235387529802e-16 -0.21938275042998551 0
		 -0.97915790771484668 96.547476348877723 52.509932658068315 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrap1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrap2Jnt" -p "keyStrap1Jnt";
	rename -uid "456081FA-4AF2-F2DB-6EEE-0680B5260BBC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 2.6967308590729147 -2.7071678232459817e-14 3.3839597790574772e-15 ;
	setAttr ".r" -type "double3" 1.987846675914698e-15 -7.9513867036587919e-16 -1.3793457181406746e-32 ;
	setAttr ".s" -type "double3" 0.9999999986351944 1.0000000078027569 1.0000000088232841 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.5764602559574916 -1.5666185963295207 -45.053111846371735 ;
	setAttr ".bps" -type "matrix" -0.044208581636011782 -0.94597102216525841 -0.32122332387878882 0
		 -0.12897420630417861 0.32425117489646615 -0.93713758077028497 0 0.99066203772564809 -8.7496359065057109e-16 -0.13634054663171746 0
		 -1.5104943127441364 95.361531993408974 50.146973634630832 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrap2Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrap3Jnt" -p "keyStrap2Jnt";
	rename -uid "DDD7A7E2-4398-896A-69A3-EB9A15B75860";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 3.6147620139151995 0 6.7679195581149544e-15 ;
	setAttr ".r" -type "double3" -1.987846675914698e-16 -7.9513867036587919e-16 1.3793457181406746e-33 ;
	setAttr ".s" -type "double3" 1.0000000178994179 1.0000000018254374 0.9999999921313445 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.3500172164538249 -6.2493174265720288 30.374448520308071 ;
	setAttr ".bps" -type "matrix" 0.0050965618671819646 -0.64829361578057487 -0.76137339630047418 0
		 0.0043395191654787835 0.76139044182358651 -0.64827908135614798 0 0.99997758869633668 -1.0963581856115913e-16 0.0066937558776680173 0
		 -1.6702978143310541 91.942071876221462 48.985827765490207 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrap3Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrap4Jnt" -p "keyStrap3Jnt";
	rename -uid "2C08B9CB-4224-82E5-92B1-DA97D11D1250";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.9544587423931401 -6.7679195581149544e-15 -6.3449245857327695e-16 ;
	setAttr ".r" -type "double3" -3.9756933518293967e-15 -1.3914926731402888e-15 2.733289179382711e-16 ;
	setAttr ".s" -type "double3" 0.9999999937372801 0.99999999933557204 0.99999999767695713 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.9803894533670192 -8.0493751505117892 66.83708193568539 ;
	setAttr ".bps" -type "matrix" 0.14595865312454648 0.44062616929758114 -0.88574524440313429 0
		 -0.07164294296250695 0.89769069028672155 0.43476282266008498 0 0.98669314151098642 -6.5753429293546624e-15 0.16259348034006624 0
		 -1.6603367944335934 90.675008751221455 47.497754874865194 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrap4Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "keyStrap5Jnt" -p "keyStrap4Jnt";
	rename -uid "5ACF3661-46C1-3569-E2C5-39A2C7750571";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 2.2226967611484438 2.7071678232459817e-14 3.3839597790574772e-15 ;
	setAttr ".r" -type "double3" -5.5659706925611542e-14 3.9756933518293496e-16 -9.5416640443905503e-15 ;
	setAttr ".s" -type "double3" 0.99999999613573998 1.0000000010869159 1.0000000027773426 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -9.7806955956131001e-15 -80.642536700812613 -26.143840200829707 ;
	setAttr ".bps" -type "matrix" 0.99999999613574042 -1.0406338495471755e-16 1.3322676295501878e-15 0
		 4.2002702847055724e-17 1.0000000010869159 3.974147140592703e-14 0 -1.3600232051658168e-15 -3.9427313400048815e-14 1.0000000027773426 0
		 -1.3359149688720733 91.65438711059646 45.529011788927725 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "keyStrap5Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_BrakeJnt" -p "steerJnt";
	rename -uid "691F188C-4F8E-6AAA-CBB9-E4966C08635E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 1.0000000148882664 0.99999997946892283 0.99999997545983643 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 119.41935206026466 -61.66802114166854 -68.385305691263611 ;
	setAttr ".bps" -type "matrix" -0.88021249071782859 -0.33532831080300618 -0.33582871368430084 0
		 -0.41338162557466845 0.8893280090617719 0.1954770648268368 0 0.2331128829723057 0.31088676781196944 -0.92141616673001769 0
		 -16.915159145507829 89.08504812622148 58.799699435412087 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "BreakJnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Brake1Jnt" -p "R_BrakeJnt";
	rename -uid "7FF9E170-4A37-F502-D6AD-9C84192F2CB9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 16.06049655273906 -1.3535839116229909e-14 -3.3839597790574772e-15 ;
	setAttr ".s" -type "double3" 1.0000000131583813 0.99999997908733795 0.99999997757130699 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "none";
	setAttr ".bps" -type "matrix" -0.88021248919516204 -0.33532831022292675 -0.33582871310335577 0
		 -0.41338162541692824 0.88932800872241768 0.19547706475224569 0 0.2331128834645167 0.31088676846839769 -0.92141616867556075 0
		 -31.051808818359373 83.699508946533967 53.406123536974583 1;
	setAttr ".sd" 2;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Break1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_BrakeJnt" -p "steerJnt";
	rename -uid "D2922C63-465C-930D-EF97-C09874998555";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 0.99999999498163372 1.0000000072063342 1.0000000146025891 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -118.54596057965178 61.667962673577442 -68.385345356521682 ;
	setAttr ".bps" -type "matrix" 0.88021225469949749 -0.33532870630238332 -0.33582887810559792 0
		 0.41688756527956483 0.88448542850683864 0.20950011715275846 0 0.22678434871661021 -0.32440745785024427 0.91832929261431251 0
		 16.915168447265629 89.085048126221452 58.799714318224574 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "BreakJnt";
	setAttr ".radi" 3.048;
createNode joint -n "L_Brake1Jnt" -p "L_BrakeJnt";
	rename -uid "3B488C2C-40F5-9DC7-83DE-ECAA8EE6140A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 16.060477610381117 1.3535839116229909e-14 -2.0303758674344862e-14 ;
	setAttr ".s" -type "double3" 0.9999999932517506 1.0000000068182511 1.0000000167205549 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "none";
	setAttr ".bps" -type "matrix" 0.88021225317683327 -0.33532870572230389 -0.33582887752465324 0
		 0.4168875651177778 0.88448542816358477 0.20950011707145499 0 0.22678434919693172 -0.32440745853732816 0.91832929455930257 0
		 31.051797656249988 83.699508946533982 53.406142140490189 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Break1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_ForkJnt" -p "steerJnt";
	rename -uid "7E2020AC-472C-727C-C655-F59CF42B27BC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 68.354985024389052 2.8218563864480823 1.9554332120327519e-10 ;
	setAttr ".r" -type "double3" -1.5530052155583578e-18 -2.4265706493099338e-20 1.987846675914698e-16 ;
	setAttr ".s" -type "double3" 0.99999998840000848 1.0000000092311825 0.99999997264328466 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.98682025053631 0.0061124692180414509 -178.4618150570326 ;
	setAttr ".bps" -type "matrix" 0.00010684920738029759 0.90718502616227326 -0.42073185485558279 0
		 -0.00023038902038813197 0.42073187718765243 0.90718501580516564 0 0.99999994039535867 1.9668759539568088e-16 0.00025396033073954959 0
		 -0.0055292555249179115 32.467942407271288 81.422887206221503 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_ForkJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_ForkRevJnt" -p "Front_ForkJnt";
	rename -uid "8F389D8F-4FFA-8E8F-A45D-549EB62DF851";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 51.709038074668136 -1.3535839116229909e-14 -1.6258869250940222e-15 ;
	setAttr ".r" -type "double3" 5.4336596178122723e-11 -1.9083328088787134e-14 1.2722218725845019e-14 ;
	setAttr ".s" -type "double3" 1.0000000157567215 1.0000000171437367 0.99999996709954131 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.985449144330417 -65.119197667279821 ;
	setAttr ".bps" -type "matrix" 1.0000000157567215 -3.5490025771920858e-16 1.9553586180776072e-16 0
		 4.0195440376029572e-16 1.0000000171437364 -2.568112403509312e-12 0 -2.9978190069224198e-17 2.5685010174211475e-12 0.99999996709954142 0
		 -4.1857922436147618e-06 79.377607465865083 59.667247704268419 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_ForkRevJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_PistonJnt" -p "Front_ForkJnt";
	rename -uid "EFE97BDA-41E7-C4DC-FDEA-9EBEC9155DE4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 36.470127293756406 -1.8435470431014227 -0.004314803212390474 ;
	setAttr ".s" -type "double3" 0.99999999042432153 0.99999999042437515 1.0000000000000782 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.98666092160724 -0.0057564801261131508 -178.46181312068498 ;
	setAttr ".bps" -type "matrix" -1.5679887384364012e-07 -0.91815191507339533 0.39622852206230097 0
		 -3.6333878387697911e-07 0.39622852206235332 0.91815191507337279 0 -1.0000000000000002 -3.0445072308124573e-15 -3.957283939133127e-07 0
		 -0.0055225212884300835 64.777456782271315 64.406303553877777 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_PistonJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_Piston1Jnt" -p "Front_PistonJnt";
	rename -uid "CE38E185-4983-C506-8E42-5FB0E1FBAA46";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 0.99999999042432142 0.99999999042437526 1.0000000000000784 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -1.5679887384364009e-07 -0.91815191507339455 0.39622852206230191 0
		 -3.6333878452026347e-07 0.39622852206235454 0.91815191507337257 0 -1.0000000000000002 -3.2993896090366441e-15 -3.9572839450387773e-07 0
		 -0.0055292555249179115 32.467942407271295 81.422887206221475 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_Piston1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_wheelJnt" -p "Front_Piston1Jnt";
	rename -uid "1893146D-46E4-A7C8-324D-D38D40AFC4D9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -2.3174623902222359e-07 -3.2975934642109904e-06 -6.0653342559064765 ;
	setAttr ".s" -type "double3" 0.99999999042433718 0.99999999327727862 1.0000000028529901 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4385252983197359 -89.999977477181645 0 ;
	setAttr ".bps" -type "matrix" -0.99999999042424337 -3.609230762936179e-07 -2.3997201375448729e-07 0
		 -3.7306365953428611e-07 0.43493473810518268 0.90046197040396703 0 -2.2062534371297556e-07 0.9004619790265358 -0.43493474227008588 0
		 6.059805000382795 32.467941313448989 81.422886486930238 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_wheelJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Front_wheel1Jnt" -p "Front_wheelJnt";
	rename -uid "FB0F3130-44F0-6CC1-C87B-D7B6F182B3D8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 12.119603604824325 1.2848574752410969e-06 -4.0268116876163163e-06 ;
	setAttr ".s" -type "double3" 1.0000000000002089 0.99999999327727851 0.99999999327734779 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 180.00001758027537 0 ;
	setAttr ".bps" -type "matrix" 1.0000000000000004 6.3721512597738108e-07 1.0651939649017996e-07 0
		 -3.7306365953428611e-07 0.43493473810518268 0.90046197040396703 0 5.2745900209211808e-07 -0.90046197040388087 0.43493473810535949 0
		 -6.0597984883867468 32.4679338720427 81.422886486930153 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "F_wheel1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_PistonJnt" -p "bodyJnt";
	rename -uid "E98FEF4F-457E-2AFE-ED78-5EB9E248A86F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 1.0000000164069904 1.0000000164069833 1.0000000000000162 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999980563120062 57.764026068216218 -89.999983559151048 ;
	setAttr ".bps" -type "matrix" 1.5305964558224439e-07 -0.53340747360322405 -0.84585843964471008 0
		 9.6521060728879726e-08 0.84585843964471785 -0.53340747360321139 0 0.99999999999999978 4.9960036108132857e-15 1.80951842176927e-07 0
		 -3.7207031250000009e-06 70.099818126221479 -8.1846323809941843 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_PistonJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_Piston1Jnt" -p "Rear_PistonJnt";
	rename -uid "935BB1D2-465B-7A59-8E8D-94AF5BECE4CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 24.308846065514018 -1.4889423027852901e-13 -2.3560207278616495e-13 ;
	setAttr ".s" -type "double3" 1.0000000164069793 1.0000000000000029 0.99999998359302855 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 32.235973931781842 -89.999989632223162 0 ;
	setAttr ".bps" -type "matrix" 1.0000000164069742 -9.6521059864997375e-08 2.7892202459005421e-08 0
		 9.6521058213441748e-08 0.99999999999999822 2.0890753134628671e-15 0 -2.7892201557874227e-08 6.6613457946159642e-16 0.99999998359302811 0
		 2.6988244233546507e-15 57.133297960205851 -28.746474983533243 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_Piston1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_ForkJnt" -p "bodyJnt";
	rename -uid "E49013B8-4B9D-446D-9E92-0A85382CF4F0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.16914548950195313 34.748137813721485 -12.483223953259813 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_ForkJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_Fork1Jnt" -p "Rear_ForkJnt";
	rename -uid "D4397755-4659-20D3-051B-2A89A91B5B31";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0 0 -53.010736650902444 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.16914548950195313 34.748137813721478 -65.493960604162254 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_Fork1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_WheelJnt" -p "Rear_ForkJnt";
	rename -uid "200C8FF4-47B0-2A02-C514-D3A1A81A6248";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 6.7065771496582025 -0.24366140624999091 -53.599366494140632 ;
	setAttr ".s" -type "double3" 1.0000000148881347 1.0000000143736647 1.00000000051447 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 179.99816211787194 0.009714519951673193 ;
	setAttr ".bps" -type "matrix" -1.0000000000000024 -0.00016955036003208444 -3.2077094870198324e-05 0
		 -0.00016955036003208444 1.0000000000000024 -4.1359031222132213e-25 0 3.2077093948067612e-05 5.438682827677846e-09 -1 0
		 6.5374316601562494 34.504476407471486 -66.082590447400435 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_WheelJnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_Wheel1Jnt" -p "Rear_WheelJnt";
	rename -uid "073E9784-4999-F274-E857-5FABF324A5D6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 6.4955811914062354 4.6224890581925138e-12 8.3922202520625433e-13 ;
	setAttr ".r" -type "double3" 0 -2.3295078406937223e-18 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999968838642 -0.0018378821016385557 -179.99028548004333 ;
	setAttr ".bps" -type "matrix" 0.99999999999999978 6.4575646080910575e-17 -6.7762635780344027e-20 0
		 -6.4602801896086935e-17 0.99999999999999989 -1.3221089863971159e-16 0 6.0986372202309624e-20 1.3221090029407282e-16 0.99999999999999989 0
		 0.041850468749997205 34.50337507934649 -66.082798806775386 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_Wheel1Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_Piston2Jnt" -p "Rear_ForkJnt";
	rename -uid "44385FEA-421B-1D6D-9575-329447AEDC9F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".s" -type "double3" 1.0000000164069904 1.0000000164069833 1.0000000000000162 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000019436878148 -57.764026068216232 90.000016440846849 ;
	setAttr ".bps" -type "matrix" -1.5305962593129654e-07 0.53340747360322383 0.84585843964471008 0
		 9.6521060728879726e-08 0.84585843964471807 -0.53340747360321128 0 -0.99999999999999978 5.4400928206633554e-15 -1.8095182552358163e-07 0
		 0 57.133297960205844 -28.746474983533254 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_Piston2Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "Rear_Piston3Jnt" -p "Rear_Piston2Jnt";
	rename -uid "6126D14D-4AD9-B102-93B3-77AA2F7B88C6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 24.308846065514022 1.3535839116229909e-13 2.3939096734462525e-13 ;
	setAttr ".r" -type "double3" -6.361109362927032e-15 1.7655625192200626e-31 3.180554681463516e-15 ;
	setAttr ".s" -type "double3" 1.0000000164070344 1.0000000000000027 0.99999998359308373 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 32.235973931781864 89.999989632224072 0 ;
	setAttr ".bps" -type "matrix" 1.000000016406974 9.6521050893215292e-08 3.3401145765633799e-07 0
		 -9.6521049428580818e-08 0.999999999999998 -3.2231627307865801e-14 0 -3.3401144673759027e-07 1.11023135121078e-16 0.99999998359302811 0
		 -3.720703125e-06 70.099818126221464 -8.1846323809941808 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "B_Piston3Jnt";
	setAttr ".radi" 3.048;
createNode joint -n "R_Pedal_1" -p "bodyJnt";
	rename -uid "4F4958E7-4A4F-B775-0307-80879F02EB23";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 0.9999999844339994 1.0000000228250929 0.99999997567523669 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 99.14840872795196 79.405507829179697 98.995027466695191 ;
	setAttr ".bps" -type "matrix" -0.028745789099567692 0.18159577000518393 -0.9829530125053112 0
		 0.0053083749391691776 0.98337328590640627 0.18151817366679554 0 0.99957263474554692 3.885780491667355e-16 -0.029231818594115517 0
		 -15.468425126953125 27.92873080688554 2.8811654308954644 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "joint41";
	setAttr ".radi" 3.048;
createNode joint -n "R_Pedal_2" -p "R_Pedal_1";
	rename -uid "766B0AC3-418E-3FCB-D243-F7B8FACA8C1F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 21.583951228886953 -1.6919798895287386e-14 3.3839597790574772e-15 ;
	setAttr ".r" -type "double3" -2.2740965972464142e-13 1.2821611059649808e-14 6.3611093629270067e-15 ;
	setAttr ".s" -type "double3" 1.0000000087501963 1.000000001266024 0.99999998998377904 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.9999999999994 -88.324901506804366 169.53727712905996 ;
	setAttr ".bps" -type "matrix" 1.0000000087501966 -1.1292307785267748e-16 -2.3592239273284576e-16 0
		 9.7881404747517986e-17 1.000000001266024 5.4034124393541607e-15 0 2.4633073358870661e-16 -5.4514516641449943e-15 0.99999998998377926 0
		 -16.08887283691406 31.848285050049586 -18.334844451306683 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "joint42";
	setAttr ".radi" 3.048;
createNode joint -n "L_Pedal_1" -p "bodyJnt";
	rename -uid "3009BF04-4033-1654-92A6-81863BFDAE6F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 0.99999999392599492 0.99999999390801875 0.99999998130306256 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 83.389718807201049 59.738003974142323 84.284072252824458 ;
	setAttr ".bps" -type "matrix" 0.050192067629041194 0.50144912133917507 -0.86373000579306081 0
		 -0.029090548615503111 0.86518712804412845 0.50060459572804517 0 0.99831581126386604 8.8817840309390888e-16 0.058012960506205503 0
		 14.713178203125 21.055154083252731 0.36574896910347121 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "joint43";
	setAttr ".radi" 3.048;
createNode joint -n "L_Pedal_2" -p "L_Pedal_1";
	rename -uid "5A0184C6-4699-EFA5-676A-CFA983B638F0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 21.579930441006287 3.3839597790574772e-15 8.4598994476436932e-15 ;
	setAttr ".r" -type "double3" 1.8129161684342041e-13 -1.5095559539331535e-29 9.5416640443905487e-15 ;
	setAttr ".s" -type "double3" 1.0000000125804656 0.99999999999547962 0.99999998742405505 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -5.4824897647770768e-14 -86.674234882718153 -30.095919697989601 ;
	setAttr ".bps" -type "matrix" 1.0000000125804658 6.7157687632199345e-16 3.5388358909926865e-16 0
		 -8.4992101300889203e-16 0.99999999999547973 -2.7232667766158628e-15 0 -5.3429483060085659e-16 2.716061119000292e-15 0.99999998742405516 0
		 15.796319531250001 31.876391241455856 -18.273484475720739 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "joint44";
	setAttr ".radi" 3.048;
createNode joint -n "standJnt" -p "bodyJnt";
	rename -uid "1E648176-4857-F5EA-659B-8C85C2411D2E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".s" -type "double3" 1.0000000076664994 0.9999999834327874 1.0000000081583325 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.73054270961979784 -5.6390977874857997 7.3937268901944773 ;
	setAttr ".bps" -type "matrix" 0.98688608306534731 0.1280642516084759 0.098262006110685182 0
		 -0.12743413239363899 0.99176585700477904 -0.012688327164438911 0 -0.099077825514023027 -8.8557634171098633e-15 0.99507969570687038 0
		 14.243283164062493 24.59018109985432 -13.536637793591833 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "standJnt";
	setAttr ".radi" 3.048;
createNode joint -n "stand1Jnt" -p "standJnt";
	rename -uid "ECCEDAC4-429C-51E7-81A1-249E34AC3C63";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 6.593272451168569 -0.63006440482004256 -20.862557270806082 ;
	setAttr ".r" -type "double3" -9.4422717105948149e-16 -3.1060104311166374e-18 9.5199219713727331e-15 ;
	setAttr ".s" -type "double3" 1.0000000003887144 0.99999999960255592 1.0000000000087295 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.9941896631709351e-17 5.6860700085475822 -7.3577470484878065 ;
	setAttr ".bps" -type "matrix" 1.0000000003887144 -1.4954652911972971e-16 -1.3877787807814457e-17 0
		 1.1093636614831695e-16 0.99999999960255603 8.9104028666638016e-15 0 4.163336342344337e-17 -8.9093347372957894e-15 1.0000000000087295 0
		 22.897400507812499 24.809667237549633 -33.640682293103538 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "stand1Jnt";
	setAttr ".radi" 3.048;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "422BC2FD-41FA-6508-ED8D-26B221875C4D";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "1DBF3E57-4F8A-CA05-6A43-FD8AB9599C0E";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "78DE0E91-4516-FAD6-6B7E-C6B6FA2D946E";
createNode displayLayerManager -n "layerManager";
	rename -uid "45FF7736-4BEC-203F-8CA4-48BE5B167657";
	setAttr ".cdl" 1;
	setAttr -s 6 ".dli[1:5]"  1 2 3 4 5;
	setAttr -s 3 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "310E834F-4FFD-B258-E15E-349E5E27CB1A";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "611A34EC-42F8-BF1F-7B7B-3DB460EF7B4F";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "B49ABBBF-4459-B1F7-709A-F4B17662E79A";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5E6ADD29-4024-2DB0-E924-F597B5539DC4";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 200 ";
	setAttr ".st" 6;
createNode displayLayer -n "Skeleton_layer";
	rename -uid "F476A73E-486B-E748-C676-1AB6E7C2836F";
	setAttr ".dt" 1;
	setAttr ".v" no;
	setAttr ".c" 30;
	setAttr ".ufem" -type "stringArray" 0  ;
	setAttr ".do" 2;
createNode displayLayer -n "Controls_layer";
	rename -uid "68B010B6-4A75-1B50-49DE-AB99260E6F06";
	setAttr ".ufem" -type "stringArray" 0  ;
	setAttr ".do" 3;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "0E5BC590-46C6-E351-E175-E6AF74FB629A";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode multDL -n "Rear_bump_alongY";
	rename -uid "9129FF57-4C90-740A-2F4D-D982075DF58A";
	setAttr ".i2" 0.99998957367844177;
createNode addDL -n "Rear_susp_h";
	rename -uid "A72C052F-4C08-C6ED-2D97-DEBDA6902C05";
	setAttr ".ihi" 2;
	setAttr ".i2" 2.0354326720752169;
createNode pointMatrixMultDL -n "Rear_susp_pivot_w";
	rename -uid "C530A757-4B4C-45FB-B581-809B43310BF4";
createNode pointMatrixMultDL -n "Rear_susp_pivot";
	rename -uid "94674CF1-47E8-576F-83F5-1FA0BB233A0E";
createNode plusMinusAverage -n "Rear_susp_dy";
	rename -uid "AFD22493-456D-E080-A96C-289FB770CC53";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multDL -n "Rear_susp_dy2";
	rename -uid "B274A04D-4C82-F9C2-3FB5-06B4D90213C6";
createNode plusMinusAverage -n "Rear_susp_rem";
	rename -uid "C44D5DDD-4310-DDAA-258F-4AB4EB9E2C64";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  2873.018798828 0.059908874;
createNode clamp -n "Rear_susp_rem_clamp";
	rename -uid "971D03AA-4477-C94A-4A47-D08B2F05C683";
	setAttr ".mx" -type "float3" 2873.0188 0 0 ;
createNode multiplyDivide -n "Rear_susp_sqrt";
	rename -uid "71D49FA0-4200-D419-730E-D9820B4DD886";
	setAttr ".op" 3;
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode plusMinusAverage -n "Rear_susp_z";
	rename -uid "7A496DAA-4002-6EC6-6B8E-F5812B79BCFE";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "Rear_bump_xz";
	rename -uid "4B6AB038-4230-DBBF-ED43-7DAA5DF8A8E8";
	setAttr ".i2" -type "float3" 0 0 -0.0045664576 ;
createNode plusMinusAverage -n "Rear_follow_corr";
	rename -uid "E759F822-48AB-FC0C-12C1-9198261817F1";
	setAttr ".op" 2;
	setAttr -s 2 ".i3[0:1]" -type "float3"  -0.16914549 0 -147.50610352
		 0 0 0;
	setAttr -s 2 ".i3";
createNode multMatrix -n "Front_WheelBump_orient_mm";
	rename -uid "4527421D-41B0-D344-E401-358D03101E22";
	setAttr -s 2 ".i";
createNode pickMatrix -n "Front_WheelBump_orient_pick";
	rename -uid "6F0AC764-43A1-1D8E-231D-1E89437C0102";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode multMatrix -n "Front_susp_M";
	rename -uid "77A87BA2-4EE6-EC66-A276-FFAFB8CA6B74";
	setAttr -s 2 ".i";
createNode pointMatrixMultDL -n "Front_susp_base";
	rename -uid "9BBBA669-46D5-F785-B1A3-808688C8C3D3";
	setAttr ".ip" -type "double3" 0 2.8218563927487423 1.0254854081398826e-06 ;
createNode vectorProduct -n "Front_susp_axis";
	rename -uid "BBB75180-4B62-8D96-B5A7-BB80105F942A";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 1 0 0 ;
createNode multDL -n "Front_bump_sign";
	rename -uid "C0206F63-4FFE-5904-BDDE-AB932BFE5F02";
	setAttr ".i2" -1;
createNode multDL -n "Front_bump_alongY";
	rename -uid "38564D6C-4B39-C1E5-60E2-E8A2A7A4AF49";
createNode plusMinusAverage -n "Front_susp_h";
	rename -uid "E85FCD7E-4D69-061A-6DC6-ADB342BF048D";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "Front_susp_s";
	rename -uid "AA0CD57D-439E-FF78-00FE-F2BC1D5272AF";
	setAttr ".op" 2;
createNode multiplyDivide -n "Front_susp_sxz";
	rename -uid "E229F2F1-4DED-298F-5B00-D0A6A77C19FE";
createNode plusMinusAverage -n "Front_susp_axle";
	rename -uid "9982DDCF-4555-3FB3-DDAC-A8BA684C85CB";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode multDL -n "Front_bump_neg";
	rename -uid "4FD303CE-41D3-58E4-38E9-2C9CB365B770";
	setAttr ".i2" -1;
createNode multiplyDivide -n "Front_bump_axle_off";
	rename -uid "8B680E9F-4111-4A3B-1279-3B8EA22F9CEE";
createNode plusMinusAverage -n "Front_susp_axle_rest";
	rename -uid "F69BE088-4DBB-1ED1-C277-EBABCEC15F82";
	setAttr -s 2 ".i3[0:1]" -type "float3"  -0.0055292556 0 0 0 0 0;
	setAttr -s 2 ".i3";
createNode multMatrix -n "Front_follow_M";
	rename -uid "23784D59-4DDF-C505-AE67-5D91C929A5A4";
	setAttr -s 2 ".i";
createNode pointMatrixMultDL -n "Front_follow_p";
	rename -uid "70F34120-4F6D-7D7D-03EC-6290DC76C559";
createNode multMatrix -n "BodyZ_fork_M";
	rename -uid "18F05649-490C-CF2C-17D0-03841D0FAF49";
	setAttr -s 2 ".i";
createNode pointMatrixMultDL -n "BodyZ_fork_base";
	rename -uid "396CBFB0-4D30-2D44-D395-B1B283A295BA";
	setAttr ".ip" -type "double3" 0 2.8218563927487423 1.0254854081398826e-06 ;
createNode vectorProduct -n "BodyZ_fork_axis";
	rename -uid "ED5713D3-4A6A-87F5-C4AB-6998D63E9FFA";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 1 0 0 ;
createNode multDL -n "BodyZ_fork_negy";
	rename -uid "0AD07037-4003-56D8-13A1-9CB7815841D4";
	setAttr ".i2" -1;
createNode multiplyDivide -n "BodyZ_fork_s";
	rename -uid "5F424DEC-49CE-8082-0F66-EFA6CD7F50FA";
	setAttr ".op" 2;
createNode multDL -n "BodyZ_fork_sz";
	rename -uid "C774AC9A-4923-56E6-A2F0-978E00FA7709";
createNode plusMinusAverage -n "BodyZ_front_fixed";
	rename -uid "DA6FC78D-47EE-27B6-22A3-6383F4FEB959";
	setAttr ".op" 2;
	setAttr -s 3 ".i1[0:2]"  0 -27.084196091 27.084196091;
	setAttr -s 2 ".i1";
createNode multMatrix -n "BodyZ_piv_M";
	rename -uid "A82793D6-4B49-EFA5-6987-31AEE1EFD230";
	setAttr -s 2 ".i";
createNode pointMatrixMultDL -n "BodyZ_piv_p";
	rename -uid "FB550F70-4184-1654-E41B-F3856FE1DEDD";
createNode plusMinusAverage -n "BodyZ_rear_dy";
	rename -uid "EFB738EA-42D9-2359-4D04-D9A3CF0A7470";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  2.035432577 2.28019547;
createNode multDL -n "BodyZ_rear_dy2";
	rename -uid "2C2FF5CE-4FDD-B296-24D6-2AB018ACA4FD";
createNode plusMinusAverage -n "BodyZ_rear_rem";
	rename -uid "9633B6B3-4743-7890-9FA8-A48C6B65ECC9";
	setAttr ".op" 2;
	setAttr -s 2 ".i1[0:1]"  2873.018798828 0.059908874;
createNode clamp -n "BodyZ_rear_clamp";
	rename -uid "2D46087B-44E5-B831-84CF-9B89C6FF1001";
	setAttr ".mx" -type "float3" 2873.0188 0 0 ;
createNode multiplyDivide -n "BodyZ_rear_sqrt";
	rename -uid "E4F48D99-4854-D48D-A8AE-69A3C52D820E";
	setAttr ".op" 3;
	setAttr ".i2" -type "float3" 0.5 1 1 ;
createNode plusMinusAverage -n "BodyZ_rear_fixed";
	rename -uid "B7CCDAEC-4B26-D1DE-AD97-55B94FD4D039";
	setAttr -s 3 ".i1[0:2]"  -147.50569153 53.59999084 93.90611267;
	setAttr -s 2 ".i1";
createNode multDL -n "BodyZ_piv_negz";
	rename -uid "13AB2D68-47F3-5D99-79A6-EAAD8068CE4B";
	setAttr ".i2" -1;
createNode multDL -n "BodyZ_rx_len";
	rename -uid "EEC42792-404C-1E76-6833-F7A5682A228E";
	setAttr ".i2" 2.5744598863397417;
createNode unitConversion -n "unitConversion1";
	rename -uid "A1DC7CDA-4E59-A3EC-EB58-7B84302EB4E2";
	setAttr ".cf" 57.295779513082323;
createNode multDL -n "BodyZ_ty_neg";
	rename -uid "BBE32100-490A-2C0F-99FB-DB93CFC8990D";
	setAttr ".i2" -1;
createNode clamp -n "BodyZ_load_clamp";
	rename -uid "C9B99666-41F3-C6DC-3376-76871406A22F";
	setAttr ".mx" -type "float3" 10000 10000 10000 ;
createNode multDL -n "BodyZ_rx_neg";
	rename -uid "BCB1C928-45A8-D321-A2B9-718951464F65";
	setAttr ".i2" -1;
createNode plusMinusAverage -n "BodyZ_load_front";
	rename -uid "E6867AD0-48D6-5A8E-4533-E19E738CD41E";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multiplyDivide -n "BodyZ_load_sq";
	rename -uid "78705769-4CDA-EDF3-11DC-578522D38E85";
createNode plusMinusAverage -n "BodyZ_load_sum";
	rename -uid "D07853F4-42AE-74DD-60A7-48AB8FA163D8";
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode condition -n "BodyZ_w_den";
	rename -uid "2E915866-4556-B6F9-7AA2-0182A54A1D42";
	setAttr ".op" 2;
	setAttr ".st" 0.09290304034948349;
createNode multiplyDivide -n "BodyZ_w_div";
	rename -uid "C00A34FA-4A66-B1B7-5CAB-0B800707544E";
	setAttr ".op" 2;
createNode condition -n "BodyZ_w";
	rename -uid "BDD87059-4127-F2AB-31D1-F0A5550EC4E2";
	setAttr ".op" 2;
	setAttr ".st" 0.09290304034948349;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode plusMinusAverage -n "BodyZ_diff";
	rename -uid "5A85A268-4BAB-F93D-1021-0398FE094770";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode multDL -n "BodyZ_wdiff";
	rename -uid "9226F375-4D3B-36D5-9580-58B4BBBEB8AF";
createNode addDL -n "BodyZ";
	rename -uid "86426C54-44E2-2F94-EA24-B9AB882B358E";
	setAttr ".ihi" 2;
createNode multMatrix -n "Front_wheelRoll_mm";
	rename -uid "3A1DD17D-474C-C3E0-767D-F9872CCAAE26";
	setAttr -s 2 ".i";
	setAttr ".i[0]" -type "matrix" -1.5679887924262455e-07 4.9466137356011202e-17 -0.99999999999998757 0
		 -0.91815191997026568 0.39622853488219911 1.4396519197748815e-07 0 0.39622853488219439 0.91815191997027701 -6.2128190233087148e-08 0
		 -2.9219959110093896e-06 4.2632564145606011e-14 -0.0055292555249160276 1;
createNode addDL -n "Front_spin_add";
	rename -uid "2DC7BAC9-4A8A-32A5-C6EE-8EBE24EF7F06";
	setAttr ".ihi" 2;
createNode unitConversion -n "unitConversion2";
	rename -uid "AF444C26-4885-F83D-4924-A38C12628DC0";
	setAttr ".cf" 57.295779513082323;
createNode wheelRoll -n "Front_wheelRoll";
	rename -uid "61BFA07F-4CD3-3193-05AF-F8A8A0438839";
	setAttr ".tbl" -type "doubleArray" 401 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06
		 -4.3999964476308648e-06 -4.3999964476308648e-06 -4.3999964476308648e-06 ;
	setAttr ".tsb" 2;
	setAttr ".tvr" 1;
	setAttr ".stp" -type "string" "834afeab101e272c16cdc7f69269ff4a";
	setAttr ".pr" yes;
	setAttr ".rp" -type "float3" -8.6736174e-19 32.467941 81.42289 ;
	setAttr ".tps" -type "doubleArray" 1203 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 -8.6736173798840355e-19 32.467942407271281 81.422887206221461
		 -8.6736173798840355e-19 32.467942407271281 81.422887206221461 -8.6736173798840355e-19
		 32.467942407271281 81.422887206221461 -8.6736173798840355e-19 32.467942407271281
		 81.422887206221461 ;
	setAttr ".uh" yes;
	setAttr ".tsc" yes;
createNode multDL -n "Front_radius_scale";
	rename -uid "77ED3A42-4C77-C2AB-0682-6BB89DC1F6A4";
	setAttr ".i1" 32.596782810986042;
createNode unitConversion -n "unitConversion3";
	rename -uid "DDA07003-4F2B-7AAF-33F9-3C9AAE2D6390";
	setAttr ".cf" 57.295779513082323;
createNode multMatrix -n "Front_pitch_M";
	rename -uid "E764FC5D-4959-34F8-FDE8-1AAE3C130701";
	setAttr -s 2 ".i";
createNode vectorProduct -n "Front_pitch_fwd";
	rename -uid "542B4898-44A8-217A-8626-16A3BA471965";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 0 0 1 ;
	setAttr ".no" yes;
createNode angleBetween -n "Front_pitch_ab";
	rename -uid "9E664BE6-4D0C-FB96-0843-C5A5F81B8332";
	setAttr ".v1" -type "double3" 0 0 1 ;
createNode plusMinusAverage -n "Front_spin_comp";
	rename -uid "37036587-4F56-7D05-1E13-D896D974FBD7";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode unitConversion -n "unitConversion4";
	rename -uid "11F1BC46-4A6B-538D-94A6-E4AFAC5C70F2";
	setAttr ".cf" 57.295779513082323;
createNode multMatrix -n "Rear_wheelRoll_mm";
	rename -uid "E43A9657-4F80-4515-5400-BDB0E68E2188";
	setAttr -s 2 ".i";
	setAttr ".i[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.16914548950195313 -0.24476273437498008 -53.599574853515577 1;
createNode addDL -n "Rear_spin_add";
	rename -uid "3237AC3F-4508-DFF4-807E-6F9C905DAF5D";
	setAttr ".ihi" 2;
createNode unitConversion -n "unitConversion5";
	rename -uid "195A5996-4264-AD99-1CD8-C589E73EDC64";
	setAttr ".cf" 57.295779513082323;
createNode wheelRoll -n "Rear_wheelRoll";
	rename -uid "65965CBB-44DC-4E1E-F2F8-E5BE358F1E94";
	setAttr ".tbl" -type "doubleArray" 401 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06
		 4.8729291488914842e-06 4.8729291488914842e-06 4.8729291488914842e-06 ;
	setAttr ".tsb" 2;
	setAttr ".tvr" 1;
	setAttr ".stp" -type "string" "2b8ab2008e8cd5ee785ef6caffe5339e";
	setAttr ".pr" yes;
	setAttr ".rp" -type "float3" 0 34.503376 -66.082802 ;
	setAttr ".tps" -type "doubleArray" 1203 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0
		 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649
		 -66.082798806775386 0 34.50337507934649 -66.082798806775386 0 34.50337507934649 -66.082798806775386
		 0 34.50337507934649 -66.082798806775386 ;
	setAttr ".uh" yes;
	setAttr ".tsc" yes;
createNode multDL -n "Rear_radius_scale";
	rename -uid "095737F6-4791-BE7B-B322-0DA01F1A4787";
	setAttr ".i1" 35.415870696306229;
createNode unitConversion -n "unitConversion6";
	rename -uid "FA31E5DB-4742-2800-1329-C0A1D7708598";
	setAttr ".cf" 57.295779513082323;
createNode multMatrix -n "Rear_pitch_M";
	rename -uid "B5F3EE12-4F82-636C-7261-25BF04D99D6C";
	setAttr -s 2 ".i";
createNode vectorProduct -n "Rear_pitch_fwd";
	rename -uid "2A62BC1A-42C9-0349-F0D4-0AB6237C603E";
	setAttr ".op" 3;
	setAttr ".i1" -type "float3" 0 0 1 ;
	setAttr ".no" yes;
createNode angleBetween -n "Rear_pitch_ab";
	rename -uid "38EB6CFA-47D2-B767-FB6C-2995B6FBEFA4";
	setAttr ".v1" -type "double3" 0 0 1 ;
createNode plusMinusAverage -n "Rear_spin_comp";
	rename -uid "440CF9B4-4EA7-1C6F-1847-9A95347F1FDE";
	setAttr ".op" 2;
	setAttr -s 2 ".i1";
	setAttr -s 2 ".i1";
createNode unitConversion -n "unitConversion7";
	rename -uid "17490919-4D7B-AEC1-F9F1-65A167ECC61B";
	setAttr ".cf" 57.295779513082323;
createNode unitConversion -n "unitConversion8";
	rename -uid "8818D31F-4B30-1DF9-E1EA-109D1E3DF753";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion9";
	rename -uid "9C4ED4B3-43BC-9E5F-7C71-559914C60173";
	setAttr ".cf" 0.017453292519943295;
createNode multDL -n "Front_spin_neg";
	rename -uid "921D8DE9-41EB-5AB2-7756-9CB8815F6095";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion10";
	rename -uid "46DADF67-408F-3383-8150-B59B4E300AF9";
	setAttr ".cf" 0.017453292519943295;
createNode multDL -n "Rear_spin_neg";
	rename -uid "0C111281-4734-0B0F-6B62-CD9A69404637";
	setAttr ".i2" -1;
createNode unitConversion -n "unitConversion11";
	rename -uid "922D3C18-495D-3967-8E8A-0D8CD8A31781";
	setAttr ".cf" 0.017453292519943295;
createNode objectSet -n "BikeRig_ctrls_SET";
	rename -uid "C6D7B0C8-4BEC-B81F-9604-DEAB7693D89C";
	setAttr ".ihi" 0;
	setAttr -s 18 ".dsm";
createNode objectSet -n "BikeRig_nodes";
	rename -uid "FF350F5C-4D1D-B939-974C-EE88C7E181A7";
	setAttr ".ihi" 0;
	setAttr -s 117 ".dsm";
	setAttr -s 87 ".dnsm";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 1;
	setAttr -av ".unw" 1;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -k on ".ihi";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av ".ta";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -av ".hfs";
	setAttr -av ".hfe";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbsof";
	setAttr ".dli" 1;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 1;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :standardSurface1;
	setAttr ".b" 0.80000001192092896;
	setAttr ".bc" -type "float3" 1 1 1 ;
	setAttr ".s" 0.20000000298023224;
	setAttr ".sr" 0.5;
select -ne :openPBR_shader1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "mayaHardware2";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr -av ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya-legacy/config.ocio";
	setAttr ".vtn" -type "string" "sRGB gamma (legacy)";
	setAttr ".vn" -type "string" "sRGB gamma";
	setAttr ".dn" -type "string" "legacy";
	setAttr ".wsn" -type "string" "scene-linear Rec 709/sRGB";
	setAttr ".ovt" no;
	setAttr ".povt" no;
	setAttr ".otn" -type "string" "sRGB gamma (legacy)";
	setAttr ".potn" -type "string" "sRGB gamma (legacy)";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -k off -cb on ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
connectAttr "guide_rootShape.wm" "guide_root_labelShape.dom" -na;
connectAttr "guide_bodyShape.wm" "guide_body_labelShape.dom" -na;
connectAttr "guide_steerTopShape.wm" "guide_steerTop_labelShape.dom" -na;
connectAttr "guide_steerBottomShape.wm" "guide_steerBottom_labelShape.dom" -na;
connectAttr "guide_frontAxleShape.wm" "guide_frontAxle_labelShape.dom" -na;
connectAttr "guide_rearAxleShape.wm" "guide_rearAxle_labelShape.dom" -na;
connectAttr "guide_swingPivotShape.wm" "guide_swingPivot_labelShape.dom" -na;
connectAttr "guide_shockTopShape.wm" "guide_shockTop_labelShape.dom" -na;
connectAttr "guide_shockBottomShape.wm" "guide_shockBottom_labelShape.dom" -na;
connectAttr "guide_L_leverShape.wm" "guide_L_lever_labelShape.dom" -na;
connectAttr "guide_L_lever_tipShape.wm" "guide_L_lever_tip_labelShape.dom" -na;
connectAttr "guide_R_leverShape.wm" "guide_R_lever_labelShape.dom" -na;
connectAttr "guide_R_lever_tipShape.wm" "guide_R_lever_tip_labelShape.dom" -na;
connectAttr "guide_L_mirrorShape.wm" "guide_L_mirror_labelShape.dom" -na;
connectAttr "guide_L_mirror_tipShape.wm" "guide_L_mirror_tip_labelShape.dom" -na
		;
connectAttr "guide_R_mirrorShape.wm" "guide_R_mirror_labelShape.dom" -na;
connectAttr "guide_R_mirror_tipShape.wm" "guide_R_mirror_tip_labelShape.dom" -na
		;
connectAttr "guide_L_pedalShape.wm" "guide_L_pedal_labelShape.dom" -na;
connectAttr "guide_L_pedal_tipShape.wm" "guide_L_pedal_tip_labelShape.dom" -na;
connectAttr "guide_R_pedalShape.wm" "guide_R_pedal_labelShape.dom" -na;
connectAttr "guide_R_pedal_tipShape.wm" "guide_R_pedal_tip_labelShape.dom" -na;
connectAttr "guide_L_standShape.wm" "guide_L_stand_labelShape.dom" -na;
connectAttr "guide_L_stand_tipShape.wm" "guide_L_stand_tip_labelShape.dom" -na;
connectAttr "Controls_layer.di" "Controls.do";
connectAttr "Root_ctrl.sy" "Root_ctrl.sx" -l on;
connectAttr "Root_ctrl.sy" "Root_ctrl.sz" -l on;
connectAttr "BodyZ.o" "Body_auto.tz";
connectAttr "Rear_follow_corr.o3x" "Rear_Wheel_follow.tx";
connectAttr "Rear_follow_corr.o3z" "Rear_Wheel_follow.tz";
connectAttr "Rear_wheelRoll.oa" "Rear_Wheel_ctrl.rax";
connectAttr "Steer_ctrl.rx" "Front_Wheel_steer.rx";
connectAttr "Front_follow_p.o" "Front_Wheel_follow.t";
connectAttr "Front_WheelBump_orient_pick.tmat" "Front_WheelBump_orient.opm";
connectAttr "Front_wheelRoll.oa" "Front_Wheel_ctrl.rax";
connectAttr "Body_ctrl.ty" "BodyNZ.ty";
connectAttr "Body_ctrl.rx" "BodyNZ.rx";
connectAttr "Root_ctrl.sy" "BikeRig_skel.sx";
connectAttr "Root_ctrl.sy" "BikeRig_skel.sy";
connectAttr "Root_ctrl.sy" "BikeRig_skel.sz";
connectAttr "bike_root_pc.ctx" "bike_root_jnt.tx";
connectAttr "bike_root_pc.cty" "bike_root_jnt.ty";
connectAttr "bike_root_pc.ctz" "bike_root_jnt.tz";
connectAttr "bike_root_pc.crx" "bike_root_jnt.rx";
connectAttr "bike_root_pc.cry" "bike_root_jnt.ry";
connectAttr "bike_root_pc.crz" "bike_root_jnt.rz";
connectAttr "bike_root_jnt.s" "bike_body_jnt.is";
connectAttr "bike_body_pc.ctx" "bike_body_jnt.tx";
connectAttr "bike_body_pc.cty" "bike_body_jnt.ty";
connectAttr "bike_body_pc.ctz" "bike_body_jnt.tz";
connectAttr "bike_body_pc.crx" "bike_body_jnt.rx";
connectAttr "bike_body_pc.cry" "bike_body_jnt.ry";
connectAttr "bike_body_pc.crz" "bike_body_jnt.rz";
connectAttr "bike_body_jnt.s" "bike_steer_jnt.is";
connectAttr "Steer_ctrl.rx" "bike_steer_jnt.rx";
connectAttr "bike_steer_jnt.s" "bike_forkSlide_jnt.is";
connectAttr "Front_susp_s.ox" "bike_forkSlide_jnt.tx";
connectAttr "bike_forkSlide_jnt.s" "bike_wheelF_jnt.is";
connectAttr "unitConversion8.o" "bike_wheelF_jnt.rx";
connectAttr "bike_steer_jnt.s" "bike_L_lever_jnt.is";
connectAttr "L_Lever_ctrl.ry" "bike_L_lever_jnt.ry";
connectAttr "bike_steer_jnt.s" "bike_R_lever_jnt.is";
connectAttr "R_Lever_ctrl.ry" "bike_R_lever_jnt.ry";
connectAttr "bike_steer_jnt.s" "bike_L_mirror_jnt.is";
connectAttr "L_Mirror_ctrl.ry" "bike_L_mirror_jnt.ry";
connectAttr "bike_steer_jnt.s" "bike_R_mirror_jnt.is";
connectAttr "R_Mirror_ctrl.ry" "bike_R_mirror_jnt.ry";
connectAttr "bike_body_jnt.s" "bike_swingarm_jnt.is";
connectAttr "bike_swingarm_aim.crx" "bike_swingarm_jnt.rx";
connectAttr "bike_swingarm_jnt.s" "bike_wheelR_jnt.is";
connectAttr "unitConversion9.o" "bike_wheelR_jnt.rx";
connectAttr "bike_swingarm_jnt.s" "bike_shockBottom_jnt.is";
connectAttr "bike_shockBottom_aim.crx" "bike_shockBottom_jnt.rx";
connectAttr "bike_shockBottom_aim.cry" "bike_shockBottom_jnt.ry";
connectAttr "bike_shockBottom_aim.crz" "bike_shockBottom_jnt.rz";
connectAttr "bike_body_jnt.s" "bike_shockTop_jnt.is";
connectAttr "bike_shockTop_aim.crx" "bike_shockTop_jnt.rx";
connectAttr "bike_shockTop_aim.cry" "bike_shockTop_jnt.ry";
connectAttr "bike_shockTop_aim.crz" "bike_shockTop_jnt.rz";
connectAttr "bike_body_jnt.s" "bike_L_pedal_jnt.is";
connectAttr "L_Pedal_ctrl.rz" "bike_L_pedal_jnt.rz";
connectAttr "bike_body_jnt.s" "bike_R_pedal_jnt.is";
connectAttr "R_Pedal_ctrl.rz" "bike_R_pedal_jnt.rz";
connectAttr "bike_body_jnt.s" "bike_L_stand_jnt.is";
connectAttr "Stand_ctrl.rx" "bike_L_stand_jnt.rx";
connectAttr "bike_root_jnt.ro" "bike_root_pc.cro";
connectAttr "bike_root_jnt.pim" "bike_root_pc.cpim";
connectAttr "bike_root_jnt.rp" "bike_root_pc.crp";
connectAttr "bike_root_jnt.rpt" "bike_root_pc.crt";
connectAttr "bike_root_jnt.jo" "bike_root_pc.cjo";
connectAttr "Drive_ctrl.t" "bike_root_pc.tg[0].tt";
connectAttr "Drive_ctrl.rp" "bike_root_pc.tg[0].trp";
connectAttr "Drive_ctrl.rpt" "bike_root_pc.tg[0].trt";
connectAttr "Drive_ctrl.r" "bike_root_pc.tg[0].tr";
connectAttr "Drive_ctrl.ro" "bike_root_pc.tg[0].tro";
connectAttr "Drive_ctrl.s" "bike_root_pc.tg[0].ts";
connectAttr "Drive_ctrl.pm" "bike_root_pc.tg[0].tpm";
connectAttr "bike_root_pc.w0" "bike_root_pc.tg[0].tw";
connectAttr "bike_body_jnt.ro" "bike_body_pc.cro";
connectAttr "bike_body_jnt.pim" "bike_body_pc.cpim";
connectAttr "bike_body_jnt.rp" "bike_body_pc.crp";
connectAttr "bike_body_jnt.rpt" "bike_body_pc.crt";
connectAttr "bike_body_jnt.jo" "bike_body_pc.cjo";
connectAttr "Body_ctrl.t" "bike_body_pc.tg[0].tt";
connectAttr "Body_ctrl.rp" "bike_body_pc.tg[0].trp";
connectAttr "Body_ctrl.rpt" "bike_body_pc.tg[0].trt";
connectAttr "Body_ctrl.r" "bike_body_pc.tg[0].tr";
connectAttr "Body_ctrl.ro" "bike_body_pc.tg[0].tro";
connectAttr "Body_ctrl.s" "bike_body_pc.tg[0].ts";
connectAttr "Body_ctrl.pm" "bike_body_pc.tg[0].tpm";
connectAttr "bike_body_pc.w0" "bike_body_pc.tg[0].tw";
connectAttr "bike_swingarm_jnt.pim" "bike_swingarm_aim.cpim";
connectAttr "bike_swingarm_jnt.t" "bike_swingarm_aim.ct";
connectAttr "bike_swingarm_jnt.rp" "bike_swingarm_aim.crp";
connectAttr "bike_swingarm_jnt.rpt" "bike_swingarm_aim.crt";
connectAttr "bike_swingarm_jnt.ro" "bike_swingarm_aim.cro";
connectAttr "bike_swingarm_jnt.jo" "bike_swingarm_aim.cjo";
connectAttr "bike_swingarm_jnt.is" "bike_swingarm_aim.is";
connectAttr "Rear_Wheel_ctrl.t" "bike_swingarm_aim.tg[0].tt";
connectAttr "Rear_Wheel_ctrl.rp" "bike_swingarm_aim.tg[0].trp";
connectAttr "Rear_Wheel_ctrl.rpt" "bike_swingarm_aim.tg[0].trt";
connectAttr "Rear_Wheel_ctrl.pm" "bike_swingarm_aim.tg[0].tpm";
connectAttr "bike_swingarm_aim.w0" "bike_swingarm_aim.tg[0].tw";
connectAttr "Body_ctrl.wm" "bike_swingarm_aim.wum";
connectAttr "bike_shockTop_jnt.pim" "bike_shockTop_aim.cpim";
connectAttr "bike_shockTop_jnt.t" "bike_shockTop_aim.ct";
connectAttr "bike_shockTop_jnt.rp" "bike_shockTop_aim.crp";
connectAttr "bike_shockTop_jnt.rpt" "bike_shockTop_aim.crt";
connectAttr "bike_shockTop_jnt.ro" "bike_shockTop_aim.cro";
connectAttr "bike_shockTop_jnt.jo" "bike_shockTop_aim.cjo";
connectAttr "bike_shockTop_jnt.is" "bike_shockTop_aim.is";
connectAttr "bike_shockBottom_jnt.t" "bike_shockTop_aim.tg[0].tt";
connectAttr "bike_shockBottom_jnt.rp" "bike_shockTop_aim.tg[0].trp";
connectAttr "bike_shockBottom_jnt.rpt" "bike_shockTop_aim.tg[0].trt";
connectAttr "bike_shockBottom_jnt.pm" "bike_shockTop_aim.tg[0].tpm";
connectAttr "bike_shockTop_aim.w0" "bike_shockTop_aim.tg[0].tw";
connectAttr "Body_ctrl.wm" "bike_shockTop_aim.wum";
connectAttr "bike_shockBottom_jnt.pim" "bike_shockBottom_aim.cpim";
connectAttr "bike_shockBottom_jnt.t" "bike_shockBottom_aim.ct";
connectAttr "bike_shockBottom_jnt.rp" "bike_shockBottom_aim.crp";
connectAttr "bike_shockBottom_jnt.rpt" "bike_shockBottom_aim.crt";
connectAttr "bike_shockBottom_jnt.ro" "bike_shockBottom_aim.cro";
connectAttr "bike_shockBottom_jnt.jo" "bike_shockBottom_aim.cjo";
connectAttr "bike_shockBottom_jnt.is" "bike_shockBottom_aim.is";
connectAttr "bike_shockTop_jnt.t" "bike_shockBottom_aim.tg[0].tt";
connectAttr "bike_shockTop_jnt.rp" "bike_shockBottom_aim.tg[0].trp";
connectAttr "bike_shockTop_jnt.rpt" "bike_shockBottom_aim.tg[0].trt";
connectAttr "bike_shockTop_jnt.pm" "bike_shockBottom_aim.tg[0].tpm";
connectAttr "bike_shockBottom_aim.w0" "bike_shockBottom_aim.tg[0].tw";
connectAttr "Body_ctrl.wm" "bike_shockBottom_aim.wum";
connectAttr "rootJnt.ro" "rootJnt_pc.cro";
connectAttr "rootJnt.pim" "rootJnt_pc.cpim";
connectAttr "rootJnt.rp" "rootJnt_pc.crp";
connectAttr "rootJnt.rpt" "rootJnt_pc.crt";
connectAttr "rootJnt.jo" "rootJnt_pc.cjo";
connectAttr "bike_root_jnt.t" "rootJnt_pc.tg[0].tt";
connectAttr "bike_root_jnt.rp" "rootJnt_pc.tg[0].trp";
connectAttr "bike_root_jnt.rpt" "rootJnt_pc.tg[0].trt";
connectAttr "bike_root_jnt.r" "rootJnt_pc.tg[0].tr";
connectAttr "bike_root_jnt.ro" "rootJnt_pc.tg[0].tro";
connectAttr "bike_root_jnt.s" "rootJnt_pc.tg[0].ts";
connectAttr "bike_root_jnt.pm" "rootJnt_pc.tg[0].tpm";
connectAttr "bike_root_jnt.jo" "rootJnt_pc.tg[0].tjo";
connectAttr "bike_root_jnt.ssc" "rootJnt_pc.tg[0].tsc";
connectAttr "bike_root_jnt.is" "rootJnt_pc.tg[0].tis";
connectAttr "rootJnt_pc.w0" "rootJnt_pc.tg[0].tw";
connectAttr "bodyJnt.ro" "bodyJnt_pc.cro";
connectAttr "bodyJnt.pim" "bodyJnt_pc.cpim";
connectAttr "bodyJnt.rp" "bodyJnt_pc.crp";
connectAttr "bodyJnt.rpt" "bodyJnt_pc.crt";
connectAttr "bodyJnt.jo" "bodyJnt_pc.cjo";
connectAttr "bike_body_jnt.t" "bodyJnt_pc.tg[0].tt";
connectAttr "bike_body_jnt.rp" "bodyJnt_pc.tg[0].trp";
connectAttr "bike_body_jnt.rpt" "bodyJnt_pc.tg[0].trt";
connectAttr "bike_body_jnt.r" "bodyJnt_pc.tg[0].tr";
connectAttr "bike_body_jnt.ro" "bodyJnt_pc.tg[0].tro";
connectAttr "bike_body_jnt.s" "bodyJnt_pc.tg[0].ts";
connectAttr "bike_body_jnt.pm" "bodyJnt_pc.tg[0].tpm";
connectAttr "bike_body_jnt.jo" "bodyJnt_pc.tg[0].tjo";
connectAttr "bike_body_jnt.ssc" "bodyJnt_pc.tg[0].tsc";
connectAttr "bike_body_jnt.is" "bodyJnt_pc.tg[0].tis";
connectAttr "bodyJnt_pc.w0" "bodyJnt_pc.tg[0].tw";
connectAttr "steerJnt.ro" "steerJnt_pc.cro";
connectAttr "steerJnt.pim" "steerJnt_pc.cpim";
connectAttr "steerJnt.rp" "steerJnt_pc.crp";
connectAttr "steerJnt.rpt" "steerJnt_pc.crt";
connectAttr "steerJnt.jo" "steerJnt_pc.cjo";
connectAttr "bike_steer_jnt.t" "steerJnt_pc.tg[0].tt";
connectAttr "bike_steer_jnt.rp" "steerJnt_pc.tg[0].trp";
connectAttr "bike_steer_jnt.rpt" "steerJnt_pc.tg[0].trt";
connectAttr "bike_steer_jnt.r" "steerJnt_pc.tg[0].tr";
connectAttr "bike_steer_jnt.ro" "steerJnt_pc.tg[0].tro";
connectAttr "bike_steer_jnt.s" "steerJnt_pc.tg[0].ts";
connectAttr "bike_steer_jnt.pm" "steerJnt_pc.tg[0].tpm";
connectAttr "bike_steer_jnt.jo" "steerJnt_pc.tg[0].tjo";
connectAttr "bike_steer_jnt.ssc" "steerJnt_pc.tg[0].tsc";
connectAttr "bike_steer_jnt.is" "steerJnt_pc.tg[0].tis";
connectAttr "steerJnt_pc.w0" "steerJnt_pc.tg[0].tw";
connectAttr "Front_Piston1Jnt.ro" "Front_Piston1Jnt_pc.cro";
connectAttr "Front_Piston1Jnt.pim" "Front_Piston1Jnt_pc.cpim";
connectAttr "Front_Piston1Jnt.rp" "Front_Piston1Jnt_pc.crp";
connectAttr "Front_Piston1Jnt.rpt" "Front_Piston1Jnt_pc.crt";
connectAttr "Front_Piston1Jnt.jo" "Front_Piston1Jnt_pc.cjo";
connectAttr "bike_forkSlide_jnt.t" "Front_Piston1Jnt_pc.tg[0].tt";
connectAttr "bike_forkSlide_jnt.rp" "Front_Piston1Jnt_pc.tg[0].trp";
connectAttr "bike_forkSlide_jnt.rpt" "Front_Piston1Jnt_pc.tg[0].trt";
connectAttr "bike_forkSlide_jnt.r" "Front_Piston1Jnt_pc.tg[0].tr";
connectAttr "bike_forkSlide_jnt.ro" "Front_Piston1Jnt_pc.tg[0].tro";
connectAttr "bike_forkSlide_jnt.s" "Front_Piston1Jnt_pc.tg[0].ts";
connectAttr "bike_forkSlide_jnt.pm" "Front_Piston1Jnt_pc.tg[0].tpm";
connectAttr "bike_forkSlide_jnt.jo" "Front_Piston1Jnt_pc.tg[0].tjo";
connectAttr "bike_forkSlide_jnt.ssc" "Front_Piston1Jnt_pc.tg[0].tsc";
connectAttr "bike_forkSlide_jnt.is" "Front_Piston1Jnt_pc.tg[0].tis";
connectAttr "Front_Piston1Jnt_pc.w0" "Front_Piston1Jnt_pc.tg[0].tw";
connectAttr "Rear_ForkJnt.ro" "Rear_ForkJnt_pc.cro";
connectAttr "Rear_ForkJnt.pim" "Rear_ForkJnt_pc.cpim";
connectAttr "Rear_ForkJnt.rp" "Rear_ForkJnt_pc.crp";
connectAttr "Rear_ForkJnt.rpt" "Rear_ForkJnt_pc.crt";
connectAttr "Rear_ForkJnt.jo" "Rear_ForkJnt_pc.cjo";
connectAttr "bike_swingarm_jnt.t" "Rear_ForkJnt_pc.tg[0].tt";
connectAttr "bike_swingarm_jnt.rp" "Rear_ForkJnt_pc.tg[0].trp";
connectAttr "bike_swingarm_jnt.rpt" "Rear_ForkJnt_pc.tg[0].trt";
connectAttr "bike_swingarm_jnt.r" "Rear_ForkJnt_pc.tg[0].tr";
connectAttr "bike_swingarm_jnt.ro" "Rear_ForkJnt_pc.tg[0].tro";
connectAttr "bike_swingarm_jnt.s" "Rear_ForkJnt_pc.tg[0].ts";
connectAttr "bike_swingarm_jnt.pm" "Rear_ForkJnt_pc.tg[0].tpm";
connectAttr "bike_swingarm_jnt.jo" "Rear_ForkJnt_pc.tg[0].tjo";
connectAttr "bike_swingarm_jnt.ssc" "Rear_ForkJnt_pc.tg[0].tsc";
connectAttr "bike_swingarm_jnt.is" "Rear_ForkJnt_pc.tg[0].tis";
connectAttr "Rear_ForkJnt_pc.w0" "Rear_ForkJnt_pc.tg[0].tw";
connectAttr "Rear_PistonJnt.ro" "Rear_PistonJnt_pc.cro";
connectAttr "Rear_PistonJnt.pim" "Rear_PistonJnt_pc.cpim";
connectAttr "Rear_PistonJnt.rp" "Rear_PistonJnt_pc.crp";
connectAttr "Rear_PistonJnt.rpt" "Rear_PistonJnt_pc.crt";
connectAttr "Rear_PistonJnt.jo" "Rear_PistonJnt_pc.cjo";
connectAttr "bike_shockTop_jnt.t" "Rear_PistonJnt_pc.tg[0].tt";
connectAttr "bike_shockTop_jnt.rp" "Rear_PistonJnt_pc.tg[0].trp";
connectAttr "bike_shockTop_jnt.rpt" "Rear_PistonJnt_pc.tg[0].trt";
connectAttr "bike_shockTop_jnt.r" "Rear_PistonJnt_pc.tg[0].tr";
connectAttr "bike_shockTop_jnt.ro" "Rear_PistonJnt_pc.tg[0].tro";
connectAttr "bike_shockTop_jnt.s" "Rear_PistonJnt_pc.tg[0].ts";
connectAttr "bike_shockTop_jnt.pm" "Rear_PistonJnt_pc.tg[0].tpm";
connectAttr "bike_shockTop_jnt.jo" "Rear_PistonJnt_pc.tg[0].tjo";
connectAttr "bike_shockTop_jnt.ssc" "Rear_PistonJnt_pc.tg[0].tsc";
connectAttr "bike_shockTop_jnt.is" "Rear_PistonJnt_pc.tg[0].tis";
connectAttr "Rear_PistonJnt_pc.w0" "Rear_PistonJnt_pc.tg[0].tw";
connectAttr "Rear_Piston2Jnt.ro" "Rear_Piston2Jnt_pc.cro";
connectAttr "Rear_Piston2Jnt.pim" "Rear_Piston2Jnt_pc.cpim";
connectAttr "Rear_Piston2Jnt.rp" "Rear_Piston2Jnt_pc.crp";
connectAttr "Rear_Piston2Jnt.rpt" "Rear_Piston2Jnt_pc.crt";
connectAttr "Rear_Piston2Jnt.jo" "Rear_Piston2Jnt_pc.cjo";
connectAttr "bike_shockBottom_jnt.t" "Rear_Piston2Jnt_pc.tg[0].tt";
connectAttr "bike_shockBottom_jnt.rp" "Rear_Piston2Jnt_pc.tg[0].trp";
connectAttr "bike_shockBottom_jnt.rpt" "Rear_Piston2Jnt_pc.tg[0].trt";
connectAttr "bike_shockBottom_jnt.r" "Rear_Piston2Jnt_pc.tg[0].tr";
connectAttr "bike_shockBottom_jnt.ro" "Rear_Piston2Jnt_pc.tg[0].tro";
connectAttr "bike_shockBottom_jnt.s" "Rear_Piston2Jnt_pc.tg[0].ts";
connectAttr "bike_shockBottom_jnt.pm" "Rear_Piston2Jnt_pc.tg[0].tpm";
connectAttr "bike_shockBottom_jnt.jo" "Rear_Piston2Jnt_pc.tg[0].tjo";
connectAttr "bike_shockBottom_jnt.ssc" "Rear_Piston2Jnt_pc.tg[0].tsc";
connectAttr "bike_shockBottom_jnt.is" "Rear_Piston2Jnt_pc.tg[0].tis";
connectAttr "Rear_Piston2Jnt_pc.w0" "Rear_Piston2Jnt_pc.tg[0].tw";
connectAttr "L_BrakeJnt.ro" "L_BrakeJnt_pc.cro";
connectAttr "L_BrakeJnt.pim" "L_BrakeJnt_pc.cpim";
connectAttr "L_BrakeJnt.rp" "L_BrakeJnt_pc.crp";
connectAttr "L_BrakeJnt.rpt" "L_BrakeJnt_pc.crt";
connectAttr "L_BrakeJnt.jo" "L_BrakeJnt_pc.cjo";
connectAttr "bike_L_lever_jnt.t" "L_BrakeJnt_pc.tg[0].tt";
connectAttr "bike_L_lever_jnt.rp" "L_BrakeJnt_pc.tg[0].trp";
connectAttr "bike_L_lever_jnt.rpt" "L_BrakeJnt_pc.tg[0].trt";
connectAttr "bike_L_lever_jnt.r" "L_BrakeJnt_pc.tg[0].tr";
connectAttr "bike_L_lever_jnt.ro" "L_BrakeJnt_pc.tg[0].tro";
connectAttr "bike_L_lever_jnt.s" "L_BrakeJnt_pc.tg[0].ts";
connectAttr "bike_L_lever_jnt.pm" "L_BrakeJnt_pc.tg[0].tpm";
connectAttr "bike_L_lever_jnt.jo" "L_BrakeJnt_pc.tg[0].tjo";
connectAttr "bike_L_lever_jnt.ssc" "L_BrakeJnt_pc.tg[0].tsc";
connectAttr "bike_L_lever_jnt.is" "L_BrakeJnt_pc.tg[0].tis";
connectAttr "L_BrakeJnt_pc.w0" "L_BrakeJnt_pc.tg[0].tw";
connectAttr "R_BrakeJnt.ro" "R_BrakeJnt_pc.cro";
connectAttr "R_BrakeJnt.pim" "R_BrakeJnt_pc.cpim";
connectAttr "R_BrakeJnt.rp" "R_BrakeJnt_pc.crp";
connectAttr "R_BrakeJnt.rpt" "R_BrakeJnt_pc.crt";
connectAttr "R_BrakeJnt.jo" "R_BrakeJnt_pc.cjo";
connectAttr "bike_R_lever_jnt.t" "R_BrakeJnt_pc.tg[0].tt";
connectAttr "bike_R_lever_jnt.rp" "R_BrakeJnt_pc.tg[0].trp";
connectAttr "bike_R_lever_jnt.rpt" "R_BrakeJnt_pc.tg[0].trt";
connectAttr "bike_R_lever_jnt.r" "R_BrakeJnt_pc.tg[0].tr";
connectAttr "bike_R_lever_jnt.ro" "R_BrakeJnt_pc.tg[0].tro";
connectAttr "bike_R_lever_jnt.s" "R_BrakeJnt_pc.tg[0].ts";
connectAttr "bike_R_lever_jnt.pm" "R_BrakeJnt_pc.tg[0].tpm";
connectAttr "bike_R_lever_jnt.jo" "R_BrakeJnt_pc.tg[0].tjo";
connectAttr "bike_R_lever_jnt.ssc" "R_BrakeJnt_pc.tg[0].tsc";
connectAttr "bike_R_lever_jnt.is" "R_BrakeJnt_pc.tg[0].tis";
connectAttr "R_BrakeJnt_pc.w0" "R_BrakeJnt_pc.tg[0].tw";
connectAttr "L_Mirror2Jnt.ro" "L_Mirror2Jnt_pc.cro";
connectAttr "L_Mirror2Jnt.pim" "L_Mirror2Jnt_pc.cpim";
connectAttr "L_Mirror2Jnt.rp" "L_Mirror2Jnt_pc.crp";
connectAttr "L_Mirror2Jnt.rpt" "L_Mirror2Jnt_pc.crt";
connectAttr "L_Mirror2Jnt.jo" "L_Mirror2Jnt_pc.cjo";
connectAttr "bike_L_mirror_jnt.t" "L_Mirror2Jnt_pc.tg[0].tt";
connectAttr "bike_L_mirror_jnt.rp" "L_Mirror2Jnt_pc.tg[0].trp";
connectAttr "bike_L_mirror_jnt.rpt" "L_Mirror2Jnt_pc.tg[0].trt";
connectAttr "bike_L_mirror_jnt.r" "L_Mirror2Jnt_pc.tg[0].tr";
connectAttr "bike_L_mirror_jnt.ro" "L_Mirror2Jnt_pc.tg[0].tro";
connectAttr "bike_L_mirror_jnt.s" "L_Mirror2Jnt_pc.tg[0].ts";
connectAttr "bike_L_mirror_jnt.pm" "L_Mirror2Jnt_pc.tg[0].tpm";
connectAttr "bike_L_mirror_jnt.jo" "L_Mirror2Jnt_pc.tg[0].tjo";
connectAttr "bike_L_mirror_jnt.ssc" "L_Mirror2Jnt_pc.tg[0].tsc";
connectAttr "bike_L_mirror_jnt.is" "L_Mirror2Jnt_pc.tg[0].tis";
connectAttr "L_Mirror2Jnt_pc.w0" "L_Mirror2Jnt_pc.tg[0].tw";
connectAttr "R_Mirror2Jnt.ro" "R_Mirror2Jnt_pc.cro";
connectAttr "R_Mirror2Jnt.pim" "R_Mirror2Jnt_pc.cpim";
connectAttr "R_Mirror2Jnt.rp" "R_Mirror2Jnt_pc.crp";
connectAttr "R_Mirror2Jnt.rpt" "R_Mirror2Jnt_pc.crt";
connectAttr "R_Mirror2Jnt.jo" "R_Mirror2Jnt_pc.cjo";
connectAttr "bike_R_mirror_jnt.t" "R_Mirror2Jnt_pc.tg[0].tt";
connectAttr "bike_R_mirror_jnt.rp" "R_Mirror2Jnt_pc.tg[0].trp";
connectAttr "bike_R_mirror_jnt.rpt" "R_Mirror2Jnt_pc.tg[0].trt";
connectAttr "bike_R_mirror_jnt.r" "R_Mirror2Jnt_pc.tg[0].tr";
connectAttr "bike_R_mirror_jnt.ro" "R_Mirror2Jnt_pc.tg[0].tro";
connectAttr "bike_R_mirror_jnt.s" "R_Mirror2Jnt_pc.tg[0].ts";
connectAttr "bike_R_mirror_jnt.pm" "R_Mirror2Jnt_pc.tg[0].tpm";
connectAttr "bike_R_mirror_jnt.jo" "R_Mirror2Jnt_pc.tg[0].tjo";
connectAttr "bike_R_mirror_jnt.ssc" "R_Mirror2Jnt_pc.tg[0].tsc";
connectAttr "bike_R_mirror_jnt.is" "R_Mirror2Jnt_pc.tg[0].tis";
connectAttr "R_Mirror2Jnt_pc.w0" "R_Mirror2Jnt_pc.tg[0].tw";
connectAttr "L_Pedal_1.ro" "L_Pedal_1_pc.cro";
connectAttr "L_Pedal_1.pim" "L_Pedal_1_pc.cpim";
connectAttr "L_Pedal_1.rp" "L_Pedal_1_pc.crp";
connectAttr "L_Pedal_1.rpt" "L_Pedal_1_pc.crt";
connectAttr "L_Pedal_1.jo" "L_Pedal_1_pc.cjo";
connectAttr "bike_L_pedal_jnt.t" "L_Pedal_1_pc.tg[0].tt";
connectAttr "bike_L_pedal_jnt.rp" "L_Pedal_1_pc.tg[0].trp";
connectAttr "bike_L_pedal_jnt.rpt" "L_Pedal_1_pc.tg[0].trt";
connectAttr "bike_L_pedal_jnt.r" "L_Pedal_1_pc.tg[0].tr";
connectAttr "bike_L_pedal_jnt.ro" "L_Pedal_1_pc.tg[0].tro";
connectAttr "bike_L_pedal_jnt.s" "L_Pedal_1_pc.tg[0].ts";
connectAttr "bike_L_pedal_jnt.pm" "L_Pedal_1_pc.tg[0].tpm";
connectAttr "bike_L_pedal_jnt.jo" "L_Pedal_1_pc.tg[0].tjo";
connectAttr "bike_L_pedal_jnt.ssc" "L_Pedal_1_pc.tg[0].tsc";
connectAttr "bike_L_pedal_jnt.is" "L_Pedal_1_pc.tg[0].tis";
connectAttr "L_Pedal_1_pc.w0" "L_Pedal_1_pc.tg[0].tw";
connectAttr "R_Pedal_1.ro" "R_Pedal_1_pc.cro";
connectAttr "R_Pedal_1.pim" "R_Pedal_1_pc.cpim";
connectAttr "R_Pedal_1.rp" "R_Pedal_1_pc.crp";
connectAttr "R_Pedal_1.rpt" "R_Pedal_1_pc.crt";
connectAttr "R_Pedal_1.jo" "R_Pedal_1_pc.cjo";
connectAttr "bike_R_pedal_jnt.t" "R_Pedal_1_pc.tg[0].tt";
connectAttr "bike_R_pedal_jnt.rp" "R_Pedal_1_pc.tg[0].trp";
connectAttr "bike_R_pedal_jnt.rpt" "R_Pedal_1_pc.tg[0].trt";
connectAttr "bike_R_pedal_jnt.r" "R_Pedal_1_pc.tg[0].tr";
connectAttr "bike_R_pedal_jnt.ro" "R_Pedal_1_pc.tg[0].tro";
connectAttr "bike_R_pedal_jnt.s" "R_Pedal_1_pc.tg[0].ts";
connectAttr "bike_R_pedal_jnt.pm" "R_Pedal_1_pc.tg[0].tpm";
connectAttr "bike_R_pedal_jnt.jo" "R_Pedal_1_pc.tg[0].tjo";
connectAttr "bike_R_pedal_jnt.ssc" "R_Pedal_1_pc.tg[0].tsc";
connectAttr "bike_R_pedal_jnt.is" "R_Pedal_1_pc.tg[0].tis";
connectAttr "R_Pedal_1_pc.w0" "R_Pedal_1_pc.tg[0].tw";
connectAttr "standJnt.ro" "standJnt_pc.cro";
connectAttr "standJnt.pim" "standJnt_pc.cpim";
connectAttr "standJnt.rp" "standJnt_pc.crp";
connectAttr "standJnt.rpt" "standJnt_pc.crt";
connectAttr "standJnt.jo" "standJnt_pc.cjo";
connectAttr "bike_L_stand_jnt.t" "standJnt_pc.tg[0].tt";
connectAttr "bike_L_stand_jnt.rp" "standJnt_pc.tg[0].trp";
connectAttr "bike_L_stand_jnt.rpt" "standJnt_pc.tg[0].trt";
connectAttr "bike_L_stand_jnt.r" "standJnt_pc.tg[0].tr";
connectAttr "bike_L_stand_jnt.ro" "standJnt_pc.tg[0].tro";
connectAttr "bike_L_stand_jnt.s" "standJnt_pc.tg[0].ts";
connectAttr "bike_L_stand_jnt.pm" "standJnt_pc.tg[0].tpm";
connectAttr "bike_L_stand_jnt.jo" "standJnt_pc.tg[0].tjo";
connectAttr "bike_L_stand_jnt.ssc" "standJnt_pc.tg[0].tsc";
connectAttr "bike_L_stand_jnt.is" "standJnt_pc.tg[0].tis";
connectAttr "standJnt_pc.w0" "standJnt_pc.tg[0].tw";
connectAttr "Front_wheelRoll_mm.o" "Front_wheelRoll_piv.opm";
connectAttr "Rear_wheelRoll_mm.o" "Rear_wheelRoll_piv.opm";
connectAttr "Skeleton_layer.di" "Skeleton.do";
connectAttr "Root_ctrl.sy" "Skeleton.sx";
connectAttr "Root_ctrl.sy" "Skeleton.sy";
connectAttr "Root_ctrl.sy" "Skeleton.sz";
connectAttr "rootJnt_pc.ctx" "rootJnt.tx";
connectAttr "rootJnt_pc.cty" "rootJnt.ty";
connectAttr "rootJnt_pc.ctz" "rootJnt.tz";
connectAttr "rootJnt_pc.crx" "rootJnt.rx";
connectAttr "rootJnt_pc.cry" "rootJnt.ry";
connectAttr "rootJnt_pc.crz" "rootJnt.rz";
connectAttr "rootJnt.s" "bodyJnt.is";
connectAttr "bodyJnt_pc.ctx" "bodyJnt.tx";
connectAttr "bodyJnt_pc.cty" "bodyJnt.ty";
connectAttr "bodyJnt_pc.ctz" "bodyJnt.tz";
connectAttr "bodyJnt_pc.crx" "bodyJnt.rx";
connectAttr "bodyJnt_pc.cry" "bodyJnt.ry";
connectAttr "bodyJnt_pc.crz" "bodyJnt.rz";
connectAttr "bodyJnt.s" "steerJnt.is";
connectAttr "steerJnt_pc.ctx" "steerJnt.tx";
connectAttr "steerJnt_pc.cty" "steerJnt.ty";
connectAttr "steerJnt_pc.ctz" "steerJnt.tz";
connectAttr "steerJnt_pc.crx" "steerJnt.rx";
connectAttr "steerJnt_pc.cry" "steerJnt.ry";
connectAttr "steerJnt_pc.crz" "steerJnt.rz";
connectAttr "steerJnt.s" "L_MirrorJnt.is";
connectAttr "L_MirrorJnt.s" "L_Mirror1Jnt.is";
connectAttr "L_MirrorJnt.s" "L_Mirror2Jnt.is";
connectAttr "L_Mirror2Jnt_pc.ctx" "L_Mirror2Jnt.tx";
connectAttr "L_Mirror2Jnt_pc.cty" "L_Mirror2Jnt.ty";
connectAttr "L_Mirror2Jnt_pc.ctz" "L_Mirror2Jnt.tz";
connectAttr "L_Mirror2Jnt_pc.crx" "L_Mirror2Jnt.rx";
connectAttr "L_Mirror2Jnt_pc.cry" "L_Mirror2Jnt.ry";
connectAttr "L_Mirror2Jnt_pc.crz" "L_Mirror2Jnt.rz";
connectAttr "L_Mirror2Jnt.s" "L_Mirror3Jnt.is";
connectAttr "L_Mirror3Jnt.s" "L_Mirror4Jnt.is";
connectAttr "L_Mirror4Jnt.s" "L_Mirror5Jnt.is";
connectAttr "steerJnt.s" "R_MirrorJnt.is";
connectAttr "R_MirrorJnt.s" "R_Mirror1Jnt.is";
connectAttr "R_MirrorJnt.s" "R_Mirror2Jnt.is";
connectAttr "R_Mirror2Jnt_pc.ctx" "R_Mirror2Jnt.tx";
connectAttr "R_Mirror2Jnt_pc.cty" "R_Mirror2Jnt.ty";
connectAttr "R_Mirror2Jnt_pc.ctz" "R_Mirror2Jnt.tz";
connectAttr "R_Mirror2Jnt_pc.crx" "R_Mirror2Jnt.rx";
connectAttr "R_Mirror2Jnt_pc.cry" "R_Mirror2Jnt.ry";
connectAttr "R_Mirror2Jnt_pc.crz" "R_Mirror2Jnt.rz";
connectAttr "R_Mirror2Jnt.s" "R_Mirror3Jnt.is";
connectAttr "R_Mirror3Jnt.s" "R_Mirror4Jnt.is";
connectAttr "R_Mirror4Jnt.s" "R_Mirror5Jnt.is";
connectAttr "steerJnt.s" "keyJnt.is";
connectAttr "keyJnt.s" "key1Jnt.is";
connectAttr "keyJnt.s" "keyStrapJnt.is";
connectAttr "keyStrapJnt.s" "keyStrap1Jnt.is";
connectAttr "keyStrap1Jnt.s" "keyStrap2Jnt.is";
connectAttr "keyStrap2Jnt.s" "keyStrap3Jnt.is";
connectAttr "keyStrap3Jnt.s" "keyStrap4Jnt.is";
connectAttr "keyStrap4Jnt.s" "keyStrap5Jnt.is";
connectAttr "steerJnt.s" "R_BrakeJnt.is";
connectAttr "R_BrakeJnt_pc.ctx" "R_BrakeJnt.tx";
connectAttr "R_BrakeJnt_pc.cty" "R_BrakeJnt.ty";
connectAttr "R_BrakeJnt_pc.ctz" "R_BrakeJnt.tz";
connectAttr "R_BrakeJnt_pc.crx" "R_BrakeJnt.rx";
connectAttr "R_BrakeJnt_pc.cry" "R_BrakeJnt.ry";
connectAttr "R_BrakeJnt_pc.crz" "R_BrakeJnt.rz";
connectAttr "R_BrakeJnt.s" "R_Brake1Jnt.is";
connectAttr "steerJnt.s" "L_BrakeJnt.is";
connectAttr "L_BrakeJnt_pc.ctx" "L_BrakeJnt.tx";
connectAttr "L_BrakeJnt_pc.cty" "L_BrakeJnt.ty";
connectAttr "L_BrakeJnt_pc.ctz" "L_BrakeJnt.tz";
connectAttr "L_BrakeJnt_pc.crx" "L_BrakeJnt.rx";
connectAttr "L_BrakeJnt_pc.cry" "L_BrakeJnt.ry";
connectAttr "L_BrakeJnt_pc.crz" "L_BrakeJnt.rz";
connectAttr "L_BrakeJnt.s" "L_Brake1Jnt.is";
connectAttr "steerJnt.s" "Front_ForkJnt.is";
connectAttr "Front_ForkJnt.s" "Front_ForkRevJnt.is";
connectAttr "Front_ForkJnt.s" "Front_PistonJnt.is";
connectAttr "Front_PistonJnt.s" "Front_Piston1Jnt.is";
connectAttr "Front_Piston1Jnt_pc.ctx" "Front_Piston1Jnt.tx";
connectAttr "Front_Piston1Jnt_pc.cty" "Front_Piston1Jnt.ty";
connectAttr "Front_Piston1Jnt_pc.ctz" "Front_Piston1Jnt.tz";
connectAttr "Front_Piston1Jnt_pc.crx" "Front_Piston1Jnt.rx";
connectAttr "Front_Piston1Jnt_pc.cry" "Front_Piston1Jnt.ry";
connectAttr "Front_Piston1Jnt_pc.crz" "Front_Piston1Jnt.rz";
connectAttr "Front_Piston1Jnt.s" "Front_wheelJnt.is";
connectAttr "unitConversion10.o" "Front_wheelJnt.rx";
connectAttr "Front_wheelJnt.s" "Front_wheel1Jnt.is";
connectAttr "bodyJnt.s" "Rear_PistonJnt.is";
connectAttr "Rear_PistonJnt_pc.ctx" "Rear_PistonJnt.tx";
connectAttr "Rear_PistonJnt_pc.cty" "Rear_PistonJnt.ty";
connectAttr "Rear_PistonJnt_pc.ctz" "Rear_PistonJnt.tz";
connectAttr "Rear_PistonJnt_pc.crx" "Rear_PistonJnt.rx";
connectAttr "Rear_PistonJnt_pc.cry" "Rear_PistonJnt.ry";
connectAttr "Rear_PistonJnt_pc.crz" "Rear_PistonJnt.rz";
connectAttr "Rear_PistonJnt.s" "Rear_Piston1Jnt.is";
connectAttr "bodyJnt.s" "Rear_ForkJnt.is";
connectAttr "Rear_ForkJnt_pc.ctx" "Rear_ForkJnt.tx";
connectAttr "Rear_ForkJnt_pc.cty" "Rear_ForkJnt.ty";
connectAttr "Rear_ForkJnt_pc.ctz" "Rear_ForkJnt.tz";
connectAttr "Rear_ForkJnt_pc.crx" "Rear_ForkJnt.rx";
connectAttr "Rear_ForkJnt_pc.cry" "Rear_ForkJnt.ry";
connectAttr "Rear_ForkJnt_pc.crz" "Rear_ForkJnt.rz";
connectAttr "Rear_ForkJnt.s" "Rear_Fork1Jnt.is";
connectAttr "Rear_ForkJnt.s" "Rear_WheelJnt.is";
connectAttr "unitConversion11.o" "Rear_WheelJnt.rx";
connectAttr "Rear_WheelJnt.s" "Rear_Wheel1Jnt.is";
connectAttr "Rear_ForkJnt.s" "Rear_Piston2Jnt.is";
connectAttr "Rear_Piston2Jnt_pc.ctx" "Rear_Piston2Jnt.tx";
connectAttr "Rear_Piston2Jnt_pc.cty" "Rear_Piston2Jnt.ty";
connectAttr "Rear_Piston2Jnt_pc.ctz" "Rear_Piston2Jnt.tz";
connectAttr "Rear_Piston2Jnt_pc.crx" "Rear_Piston2Jnt.rx";
connectAttr "Rear_Piston2Jnt_pc.cry" "Rear_Piston2Jnt.ry";
connectAttr "Rear_Piston2Jnt_pc.crz" "Rear_Piston2Jnt.rz";
connectAttr "Rear_Piston2Jnt.s" "Rear_Piston3Jnt.is";
connectAttr "bodyJnt.s" "R_Pedal_1.is";
connectAttr "R_Pedal_1_pc.ctx" "R_Pedal_1.tx";
connectAttr "R_Pedal_1_pc.cty" "R_Pedal_1.ty";
connectAttr "R_Pedal_1_pc.ctz" "R_Pedal_1.tz";
connectAttr "R_Pedal_1_pc.crx" "R_Pedal_1.rx";
connectAttr "R_Pedal_1_pc.cry" "R_Pedal_1.ry";
connectAttr "R_Pedal_1_pc.crz" "R_Pedal_1.rz";
connectAttr "R_Pedal_1.s" "R_Pedal_2.is";
connectAttr "bodyJnt.s" "L_Pedal_1.is";
connectAttr "L_Pedal_1_pc.ctx" "L_Pedal_1.tx";
connectAttr "L_Pedal_1_pc.cty" "L_Pedal_1.ty";
connectAttr "L_Pedal_1_pc.ctz" "L_Pedal_1.tz";
connectAttr "L_Pedal_1_pc.crx" "L_Pedal_1.rx";
connectAttr "L_Pedal_1_pc.cry" "L_Pedal_1.ry";
connectAttr "L_Pedal_1_pc.crz" "L_Pedal_1.rz";
connectAttr "L_Pedal_1.s" "L_Pedal_2.is";
connectAttr "bodyJnt.s" "standJnt.is";
connectAttr "standJnt_pc.ctx" "standJnt.tx";
connectAttr "standJnt_pc.cty" "standJnt.ty";
connectAttr "standJnt_pc.ctz" "standJnt.tz";
connectAttr "standJnt_pc.crx" "standJnt.rx";
connectAttr "standJnt_pc.cry" "standJnt.ry";
connectAttr "standJnt_pc.crz" "standJnt.rz";
connectAttr "standJnt.s" "stand1Jnt.is";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "layerManager.dli[2]" "Skeleton_layer.id";
connectAttr "layerManager.dli[3]" "Controls_layer.id";
connectAttr "Rear_WheelBump_ctrl.ty" "Rear_bump_alongY.i1";
connectAttr "Rear_bump_alongY.o" "Rear_susp_h.i1";
connectAttr "bike_swingarm_jnt.t" "Rear_susp_pivot_w.ip";
connectAttr "bike_swingarm_jnt.pm" "Rear_susp_pivot_w.im";
connectAttr "Rear_susp_pivot_w.o" "Rear_susp_pivot.ip";
connectAttr "Stoppie_ctrl.wim" "Rear_susp_pivot.im";
connectAttr "Rear_susp_h.o" "Rear_susp_dy.i1[0]";
connectAttr "Rear_susp_pivot.oy" "Rear_susp_dy.i1[1]";
connectAttr "Rear_susp_dy.o1" "Rear_susp_dy2.i1";
connectAttr "Rear_susp_dy.o1" "Rear_susp_dy2.i2";
connectAttr "Rear_susp_dy2.o" "Rear_susp_rem.i1[1]";
connectAttr "Rear_susp_rem.o1" "Rear_susp_rem_clamp.ipr";
connectAttr "Rear_susp_rem_clamp.opr" "Rear_susp_sqrt.i1x";
connectAttr "Rear_susp_pivot.oz" "Rear_susp_z.i1[0]";
connectAttr "Rear_susp_sqrt.ox" "Rear_susp_z.i1[1]";
connectAttr "Rear_WheelBump_ctrl.ty" "Rear_bump_xz.i1x";
connectAttr "Rear_WheelBump_ctrl.ty" "Rear_bump_xz.i1y";
connectAttr "Rear_WheelBump_ctrl.ty" "Rear_bump_xz.i1z";
connectAttr "Rear_susp_pivot.ox" "Rear_follow_corr.i3[0].i3x";
connectAttr "Rear_susp_z.o1" "Rear_follow_corr.i3[0].i3z";
connectAttr "Rear_bump_xz.o" "Rear_follow_corr.i3[1]";
connectAttr "bike_steer_jnt.wm" "Front_WheelBump_orient_mm.i[0]";
connectAttr "Front_WheelBump_pos.wim" "Front_WheelBump_orient_mm.i[1]";
connectAttr "Front_WheelBump_orient_mm.o" "Front_WheelBump_orient_pick.imat";
connectAttr "bike_steer_jnt.wm" "Front_susp_M.i[0]";
connectAttr "Stoppie_ctrl.wim" "Front_susp_M.i[1]";
connectAttr "Front_susp_M.o" "Front_susp_base.im";
connectAttr "Front_susp_M.o" "Front_susp_axis.m";
connectAttr "Front_WheelBump_ctrl.ty" "Front_bump_sign.i1";
connectAttr "Front_bump_sign.o" "Front_bump_alongY.i1";
connectAttr "Front_susp_axis.oy" "Front_bump_alongY.i2";
connectAttr "Front_bump_alongY.o" "Front_susp_h.i1[0]";
connectAttr "Front_susp_base.oy" "Front_susp_h.i1[1]";
connectAttr "Front_susp_h.o1" "Front_susp_s.i1x";
connectAttr "Front_susp_axis.oy" "Front_susp_s.i2x";
connectAttr "Front_susp_s.ox" "Front_susp_sxz.i1x";
connectAttr "Front_susp_s.ox" "Front_susp_sxz.i1z";
connectAttr "Front_susp_axis.ox" "Front_susp_sxz.i2x";
connectAttr "Front_susp_axis.oz" "Front_susp_sxz.i2z";
connectAttr "Front_susp_base.o" "Front_susp_axle.i3[0]";
connectAttr "Front_susp_sxz.o" "Front_susp_axle.i3[1]";
connectAttr "Front_bump_sign.o" "Front_bump_neg.i1";
connectAttr "Front_susp_axis.ox" "Front_bump_axle_off.i1x";
connectAttr "Front_susp_axis.oz" "Front_bump_axle_off.i1z";
connectAttr "Front_bump_neg.o" "Front_bump_axle_off.i2x";
connectAttr "Front_bump_neg.o" "Front_bump_axle_off.i2z";
connectAttr "Front_susp_axle.o3x" "Front_susp_axle_rest.i3[0].i3x";
connectAttr "Front_susp_axle.o3z" "Front_susp_axle_rest.i3[0].i3z";
connectAttr "Front_bump_axle_off.ox" "Front_susp_axle_rest.i3[1].i3x";
connectAttr "Front_bump_axle_off.oz" "Front_susp_axle_rest.i3[1].i3z";
connectAttr "Stoppie_ctrl.wm" "Front_follow_M.i[0]";
connectAttr "Front_Wheel_steer.wim" "Front_follow_M.i[1]";
connectAttr "Front_susp_axle_rest.o3" "Front_follow_p.ip";
connectAttr "Front_follow_M.o" "Front_follow_p.im";
connectAttr "BodyNZ_fork.wm" "BodyZ_fork_M.i[0]";
connectAttr "Stoppie_ctrl.wim" "BodyZ_fork_M.i[1]";
connectAttr "BodyZ_fork_M.o" "BodyZ_fork_base.im";
connectAttr "BodyZ_fork_M.o" "BodyZ_fork_axis.m";
connectAttr "BodyZ_fork_base.oy" "BodyZ_fork_negy.i1";
connectAttr "BodyZ_fork_negy.o" "BodyZ_fork_s.i1x";
connectAttr "BodyZ_fork_axis.oy" "BodyZ_fork_s.i2x";
connectAttr "BodyZ_fork_s.ox" "BodyZ_fork_sz.i1";
connectAttr "BodyZ_fork_axis.oz" "BodyZ_fork_sz.i2";
connectAttr "BodyZ_fork_base.oz" "BodyZ_front_fixed.i1[1]";
connectAttr "BodyZ_fork_sz.o" "BodyZ_front_fixed.i1[2]";
connectAttr "BodyNZ_pivot.wm" "BodyZ_piv_M.i[0]";
connectAttr "Stoppie_ctrl.wim" "BodyZ_piv_M.i[1]";
connectAttr "BodyZ_piv_M.o" "BodyZ_piv_p.im";
connectAttr "BodyZ_piv_p.oy" "BodyZ_rear_dy.i1[1]";
connectAttr "BodyZ_rear_dy.o1" "BodyZ_rear_dy2.i1";
connectAttr "BodyZ_rear_dy.o1" "BodyZ_rear_dy2.i2";
connectAttr "BodyZ_rear_dy2.o" "BodyZ_rear_rem.i1[1]";
connectAttr "BodyZ_rear_rem.o1" "BodyZ_rear_clamp.ipr";
connectAttr "BodyZ_rear_clamp.opr" "BodyZ_rear_sqrt.i1x";
connectAttr "BodyZ_rear_sqrt.ox" "BodyZ_rear_fixed.i1[1]";
connectAttr "BodyZ_piv_negz.o" "BodyZ_rear_fixed.i1[2]";
connectAttr "BodyZ_piv_p.oz" "BodyZ_piv_negz.i1";
connectAttr "unitConversion1.o" "BodyZ_rx_len.i1";
connectAttr "Body_ctrl.rx" "unitConversion1.i";
connectAttr "Body_ctrl.ty" "BodyZ_ty_neg.i1";
connectAttr "BodyZ_ty_neg.o" "BodyZ_load_clamp.ipr";
connectAttr "BodyZ_rx_len.o" "BodyZ_load_clamp.ipg";
connectAttr "BodyZ_rx_neg.o" "BodyZ_load_clamp.ipb";
connectAttr "BodyZ_rx_len.o" "BodyZ_rx_neg.i1";
connectAttr "BodyZ_load_clamp.opr" "BodyZ_load_front.i1[0]";
connectAttr "BodyZ_load_clamp.opg" "BodyZ_load_front.i1[1]";
connectAttr "BodyZ_load_front.o1" "BodyZ_load_sq.i1x";
connectAttr "BodyZ_load_clamp.opb" "BodyZ_load_sq.i1y";
connectAttr "BodyZ_load_front.o1" "BodyZ_load_sq.i2x";
connectAttr "BodyZ_load_clamp.opb" "BodyZ_load_sq.i2y";
connectAttr "BodyZ_load_sq.ox" "BodyZ_load_sum.i1[0]";
connectAttr "BodyZ_load_sq.oy" "BodyZ_load_sum.i1[1]";
connectAttr "BodyZ_load_sum.o1" "BodyZ_w_den.ft";
connectAttr "BodyZ_load_sum.o1" "BodyZ_w_den.ctr";
connectAttr "BodyZ_load_sq.oy" "BodyZ_w_div.i1x";
connectAttr "BodyZ_w_den.ocr" "BodyZ_w_div.i2x";
connectAttr "BodyZ_load_sum.o1" "BodyZ_w.ft";
connectAttr "BodyZ_w_div.ox" "BodyZ_w.ctr";
connectAttr "BodyZ_rear_fixed.o1" "BodyZ_diff.i1[0]";
connectAttr "BodyZ_front_fixed.o1" "BodyZ_diff.i1[1]";
connectAttr "BodyZ_diff.o1" "BodyZ_wdiff.i1";
connectAttr "BodyZ_w.ocr" "BodyZ_wdiff.i2";
connectAttr "BodyZ_front_fixed.o1" "BodyZ.i1";
connectAttr "BodyZ_wdiff.o" "BodyZ.i2";
connectAttr "bike_forkSlide_jnt.wm" "Front_wheelRoll_mm.i[1]";
connectAttr "unitConversion2.o" "Front_spin_add.i2";
connectAttr "unitConversion3.o" "Front_spin_add.i1";
connectAttr "Front_Wheel_ctrl.rx" "unitConversion2.i";
connectAttr "Front_radius_scale.o" "Front_wheelRoll.rad";
connectAttr "Front_wheelRoll_piv.wm" "Front_wheelRoll.im";
connectAttr ":time1.o" "Front_wheelRoll.it";
connectAttr "Front_Wheel_ctrl.autoRoll" "Front_wheelRoll.ar";
connectAttr "Drive_ctrl.wm" "Front_wheelRoll.hm";
connectAttr "Root_ctrl.sy" "Front_radius_scale.i2";
connectAttr "Front_wheelRoll.oa" "unitConversion3.i";
connectAttr "Front_wheelRoll_piv.wm" "Front_pitch_M.i[0]";
connectAttr "COG_ctrl.wim" "Front_pitch_M.i[1]";
connectAttr "Front_pitch_M.o" "Front_pitch_fwd.m";
connectAttr "Front_pitch_fwd.o" "Front_pitch_ab.v2";
connectAttr "Front_spin_add.o" "Front_spin_comp.i1[0]";
connectAttr "unitConversion4.o" "Front_spin_comp.i1[1]";
connectAttr "Front_pitch_ab.eux" "unitConversion4.i";
connectAttr "bike_swingarm_jnt.wm" "Rear_wheelRoll_mm.i[1]";
connectAttr "unitConversion5.o" "Rear_spin_add.i2";
connectAttr "unitConversion6.o" "Rear_spin_add.i1";
connectAttr "Rear_Wheel_ctrl.rx" "unitConversion5.i";
connectAttr "Rear_radius_scale.o" "Rear_wheelRoll.rad";
connectAttr "Rear_wheelRoll_piv.wm" "Rear_wheelRoll.im";
connectAttr ":time1.o" "Rear_wheelRoll.it";
connectAttr "Rear_Wheel_ctrl.autoRoll" "Rear_wheelRoll.ar";
connectAttr "Drive_ctrl.wm" "Rear_wheelRoll.hm";
connectAttr "Root_ctrl.sy" "Rear_radius_scale.i2";
connectAttr "Rear_wheelRoll.oa" "unitConversion6.i";
connectAttr "Rear_wheelRoll_piv.wm" "Rear_pitch_M.i[0]";
connectAttr "COG_ctrl.wim" "Rear_pitch_M.i[1]";
connectAttr "Rear_pitch_M.o" "Rear_pitch_fwd.m";
connectAttr "Rear_pitch_fwd.o" "Rear_pitch_ab.v2";
connectAttr "Rear_spin_add.o" "Rear_spin_comp.i1[0]";
connectAttr "unitConversion7.o" "Rear_spin_comp.i1[1]";
connectAttr "Rear_pitch_ab.eux" "unitConversion7.i";
connectAttr "Front_spin_comp.o1" "unitConversion8.i";
connectAttr "Rear_spin_comp.o1" "unitConversion9.i";
connectAttr "Front_spin_comp.o1" "Front_spin_neg.i1";
connectAttr "Front_spin_neg.o" "unitConversion10.i";
connectAttr "Rear_spin_comp.o1" "Rear_spin_neg.i1";
connectAttr "Rear_spin_neg.o" "unitConversion11.i";
connectAttr "Root_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Drive_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "COG_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Wheelie_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Stoppie_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Body_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Steer_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "L_Lever_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "R_Lever_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "L_Mirror_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "R_Mirror_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "L_Pedal_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "R_Pedal_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Stand_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Rear_WheelBump_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Rear_Wheel_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Front_WheelBump_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "Front_Wheel_ctrl.iog" "BikeRig_ctrls_SET.dsm" -na;
connectAttr "BikeRig.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Controls.iog" "BikeRig_nodes.dsm" -na;
connectAttr "BikeRig_skel.iog" "BikeRig_nodes.dsm" -na;
connectAttr "RigSystem.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Constraints.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_root_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_body_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_steer_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_forkSlide_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_wheelF_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_swingarm_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_wheelR_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_shockTop_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_shockBottom_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Root_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Root_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Drive_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Drive_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "COG_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "COG_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Wheelie_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Wheelie_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stoppie_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stoppie_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Body_auto.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Body_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Body_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Steer_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Steer_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_root_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_body_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_L_lever_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Lever_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Lever_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_R_lever_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Lever_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Lever_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_L_mirror_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Mirror_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Mirror_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_R_mirror_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Mirror_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Mirror_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_L_pedal_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_R_pedal_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_L_stand_jnt.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stand_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stand_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Wheel_follow.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_WheelBump_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_WheelBump_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Wheel_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Wheel_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_swingarm_aim.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_shockTop_aim.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bike_shockBottom_aim.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_steer_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_steer.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_follow.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_WheelBump_pos.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_WheelBump_orient.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_WheelBump_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_WheelBump_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_ctrl_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_ctrl.iog" "BikeRig_nodes.dsm" -na;
connectAttr "BodyNZ_offset.iog" "BikeRig_nodes.dsm" -na;
connectAttr "BodyNZ.iog" "BikeRig_nodes.dsm" -na;
connectAttr "BodyNZ_fork.iog" "BikeRig_nodes.dsm" -na;
connectAttr "BodyNZ_pivot.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_wheelRoll_piv.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_wheelRoll_piv.iog" "BikeRig_nodes.dsm" -na;
connectAttr "rootJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "bodyJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "steerJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Piston1Jnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_ForkJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_PistonJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Piston2Jnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_BrakeJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_BrakeJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Mirror2Jnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Mirror2Jnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_1_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_1_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "standJnt_pc.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Root_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Root_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Drive_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "COG_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "COG_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "COG_ctrlShape2.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Wheelie_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stoppie_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Body_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Steer_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Steer_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Lever_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Lever_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Mirror_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Mirror_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "L_Pedal_ctrlShape2.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "R_Pedal_ctrlShape2.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Stand_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_WheelBump_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Wheel_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_Wheel_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_WheelBump_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_ctrlShape.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Front_Wheel_ctrlShape1.iog" "BikeRig_nodes.dsm" -na;
connectAttr "Rear_bump_alongY.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_h.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_pivot_w.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_pivot.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_dy.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_dy2.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_rem.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_rem_clamp.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_sqrt.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_susp_z.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_bump_xz.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_follow_corr.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_WheelBump_orient_mm.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_WheelBump_orient_pick.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_base.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_axis.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_bump_sign.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_bump_alongY.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_h.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_s.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_sxz.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_axle.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_bump_neg.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_bump_axle_off.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_susp_axle_rest.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_follow_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_follow_p.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_base.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_axis.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_negy.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_s.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_fork_sz.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_front_fixed.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_piv_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_piv_p.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_dy.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_dy2.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_rem.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_clamp.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_sqrt.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rear_fixed.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_piv_negz.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rx_len.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion1.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_ty_neg.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_load_clamp.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_rx_neg.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_load_front.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_load_sq.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_load_sum.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_w_den.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_w_div.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_w.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_diff.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ_wdiff.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BodyZ.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_wheelRoll_mm.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_spin_add.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion2.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_wheelRoll.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_radius_scale.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion3.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_pitch_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_pitch_fwd.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_pitch_ab.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_spin_comp.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion4.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_wheelRoll_mm.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_spin_add.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion5.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_wheelRoll.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_radius_scale.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion6.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_pitch_M.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_pitch_fwd.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_pitch_ab.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_spin_comp.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion7.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion8.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion9.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Front_spin_neg.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion10.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "Rear_spin_neg.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "unitConversion11.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "BikeRig_ctrls_SET.msg" "BikeRig_nodes.dnsm" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of bike_rig.ma
