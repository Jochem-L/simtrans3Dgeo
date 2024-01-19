%Schat parameters voor PROJ4-string en PROJ-pipeline

%Ellipsoides van stelsel 1 en 2
%ellips1 = 'ackermann';
%ellips2 = 'GRS80';

%Specificeer de volgorde van coordinaten breedte, lengte ('latlon') of lengte, breedte ('lonlat')
%coordorder = 'lonlat';

%Specificeer nulmeridiaan van stelsel 1 en stelsel 2
%pm1 = 4.883882778;
%pm2 = 0;

%Select/deselect (1/0), lon lat h van stelsel 1, lon lat h van stelsel 2 en (optioneel) puntnamen (NB: gebruik gemiddeld zeeniveau of hoogte van maaiveld als benadering van onbekende hoogte)
%input = {
%          1  -1.435875000  51.273491667  0    3.447952651  51.273085186  44.4637  'Aardenburg'
%          1  +0.503791667  52.155661111  0    5.387203649  52.155172888  43.2772  'Amersfoort'
%          1  -1.130363889  51.228194444  0    3.753385074  51.227795247  44.5598  'Assenede'
%
%          0  +0.174627778  53.296516667  0    5.058218870  53.295821030  41.6037  'Vlieland'
%};

%Definieer ellipsoides die niet in PROJ zitten
%ackermann.a = 6376950.4;
%ackermann.f = 1/309.65;
%ackermann.b = ackermann.a - ackermann.a * ackermann.f;
%save('Ellipsoids.mat', 'ackermann');

%Schat parameters
%diary([mfilename, '_', datestr(now(), 'yyyymmddHHMMSS'), '.txt']); 
%simtrans3Dgeo(input, coordorder, ellips1, ellips2, pm1, pm2); 
%diary off; 


function pipeline = simtrans3Dgeo(input, coordorder, ellips1, ellips2, pm1, pm2)

%Voeg ellipsoides uit PROJ toe aan bestand Ellipsoids.mat
MERIT.a = 6378137.0;
MERIT.f = 1/298.257; %MERIT 1983    
MERIT.b = MERIT.a - MERIT.a * MERIT.f;
SGS85.a = 6378136.0;
SGS85.f = 1/298.257; %Soviet Geodetic System 85  
SGS85.b = SGS85.a - SGS85.a * SGS85.f;
GRS80.a = 6378137.0;
GRS80.f = 1/298.257222101; %GRS 1980(IUGG, 1980)   
GRS80.b = GRS80.a - GRS80.a * GRS80.f;
IAU76.a = 6378140.0;
IAU76.f = 1/298.257; %IAU 1976    
IAU76.b = IAU76.a - IAU76.a * IAU76.f;
airy.a = 6377563.396;
airy.f = 1/299.3249646; %Airy 1830    
airy.b = airy.a - airy.a * airy.f;
NWL9D.a = 6378145.0;
NWL9D.f = 1/298.25; %Naval Weapons Lab., 1965  
NWL9D.b = NWL9D.a - NWL9D.a * NWL9D.f;
mod_airy.a = 6377340.189;
mod_airy.b = 6356034.446; %Modified Airy    
mod_airy.f = (mod_airy.a - mod_airy.b) / mod_airy.a;
andrae.a = 6377104.43;
andrae.f = 1/300.0; %Andrae 1876 (Den., Iclnd.)  
andrae.b = andrae.a - andrae.a * andrae.f;
danish.a = 6377019.2563;
danish.f = 1/300.0; %Andrae 1876 (Denmark, Iceland)  
danish.b = danish.a - danish.a * danish.f;
aust_SA.a = 6378160.0;
aust_SA.f = 1/298.25; %Australian Natl & S. Amer. 1969
aust_SA.b = aust_SA.a - aust_SA.a * aust_SA.f;
GRS67.a = 6378160.0;
GRS67.f = 1/298.2471674270; %GRS 67(IUGG 1967)   
GRS67.b = GRS67.a - GRS67.a * GRS67.f;
GSK2011.a = 6378136.5;
GSK2011.f = 1/298.2564151; %GSK-2011     
GSK2011.b = GSK2011.a - GSK2011.a * GSK2011.f;
bessel.a = 6377397.155;
bessel.f = 1/299.1528128; %Bessel 1841    
bessel.b = bessel.a - bessel.a * bessel.f;
bess_nam.a = 6377483.865;
bess_nam.f = 1/299.1528128; %Bessel 1841 (Namibia)   
bess_nam.b = bess_nam.a - bess_nam.a * bess_nam.f;
clrk66.a = 6378206.4;
clrk66.b = 6356583.8; %Clarke 1866    
clrk66.f = (clrk66.a - clrk66.b) / clrk66.a;
clrk80.a = 6378249.145;
clrk80.f = 1/293.4663; %Clarke 1880 mod.   
clrk80.b = clrk80.a - clrk80.a * clrk80.f;
clrk80ign.a = 6378249.2;
clrk80ign.f = 1/293.4660212936269; %Clarke 1880 (IGN).   
clrk80ign.b = clrk80ign.a - clrk80ign.a * clrk80ign.f;
CPM.a = 6375738.7;
CPM.f = 1/334.29; %Comm. des Poids et Mesures 1799
CPM.b = CPM.a - CPM.a * CPM.f;
delmbr.a = 6376428.;
delmbr.f = 1/311.5; %Delambre 1810 (Belgium)   
delmbr.b = delmbr.a - delmbr.a * delmbr.f;
engelis.a = 6378136.05;
engelis.f = 1/298.2566; %Engelis 1985    
engelis.b = engelis.a - engelis.a * engelis.f;
evrst30.a = 6377276.345;
evrst30.f = 1/300.8017; %Everest 1830    
evrst30.b = evrst30.a - evrst30.a * evrst30.f;
evrst48.a = 6377304.063;
evrst48.f = 1/300.8017; %Everest 1948    
evrst48.b = evrst48.a - evrst48.a * evrst48.f;
evrst56.a = 6377301.243;
evrst56.f = 1/300.8017; %Everest 1956    
evrst56.b = evrst56.a - evrst56.a * evrst56.f;
evrst69.a = 6377295.664;
evrst69.f = 1/300.8017; %Everest 1969    
evrst69.b = evrst69.a - evrst69.a * evrst69.f;
evrstSS.a = 6377298.556;
evrstSS.f = 1/300.8017; %Everest (Sabah & Sarawak)  
evrstSS.b = evrstSS.a - evrstSS.a * evrstSS.f;
fschr60.a = 6378166.;
fschr60.f = 1/298.3; %Fischer (Mercury Datum) 1960  
fschr60.b = fschr60.a - fschr60.a * fschr60.f;
fschr60m.a = 6378155.;
fschr60m.f = 1/298.3; %Modified Fischer 1960   
fschr60m.b = fschr60m.a - fschr60m.a * fschr60m.f;
fschr68.a = 6378150.;
fschr68.f = 1/298.3; %Fischer 1968    
fschr68.b = fschr68.a - fschr68.a * fschr68.f;
helmert.a = 6378200.;
helmert.f = 1/298.3; %Helmert 1906    
helmert.b = helmert.a - helmert.a * helmert.f;
hough.a = 6378270.0;
hough.f = 1/297.; %Hough     
hough.b = hough.a - hough.a * hough.f;
intl.a = 6378388.0;
intl.f = 1/297.; %International 1924 (Hayford 1909, 1910) 
intl.b = intl.a - intl.a * intl.f;
krass.a = 6378245.0;
krass.f = 1/298.3; %Krassovsky, 1942    
krass.b = krass.a - krass.a * krass.f;
kaula.a = 6378163.;
kaula.f = 1/298.24; %Kaula 1961    
kaula.b = kaula.a - kaula.a * kaula.f;
lerch.a = 6378139.;
lerch.f = 1/298.257; %Lerch 1979    
lerch.b = lerch.a - lerch.a * lerch.f;
mprts.a = 6397300.;
mprts.f = 1/191.; %Maupertius 1738    
mprts.b = mprts.a - mprts.a * mprts.f;
new_intl.a = 6378157.5;
new_intl.b = 6356772.2; %New International 1967   
new_intl.f = (new_intl.a - new_intl.b) / new_intl.a;
plessis.a = 6376523.;
plessis.b = 6355863.; %Plessis 1817 (France)   
plessis.f = (plessis.a - plessis.b) / plessis.a;
PZ90.a = 6378136.0;
PZ90.f = 1/298.25784; %PZ-90     
PZ90.b = PZ90.a - PZ90.a * PZ90.f;
SEasia.a = 6378155.0;
SEasia.b = 6356773.3205; %Southeast Asia    
SEasia.f = (SEasia.a - SEasia.b) / SEasia.a;
walbeck.a = 6376896.0;
walbeck.b = 6355834.8467; %Walbeck     
walbeck.f = (walbeck.a - walbeck.b) / walbeck.a;
WGS60.a = 6378165.0;
WGS60.f = 1/298.3; %WGS 60    
WGS60.b = WGS60.a - WGS60.a * WGS60.f;
WGS66.a = 6378145.0;
WGS66.f = 1/298.25; %WGS 66    
WGS66.b = WGS66.a - WGS66.a * WGS66.f;
WGS72.a = 6378135.0;
WGS72.f = 1/298.26; %WGS 72    
WGS72.b = WGS72.a - WGS72.a * WGS72.f;
WGS84.a = 6378137.0;
WGS84.f = 1/298.257223563; %WGS 84    
WGS84.b = WGS84.a - WGS84.a * WGS84.f;
sphere.a = 6370997.0;
sphere.b = 6370997.0; %Normal Sphere (r=6370997)   
sphere.f = 0;
save('Ellipsoids.mat', 'MERIT', 'SGS85', 'GRS80', 'IAU76', 'airy', 'NWL9D', 'mod_airy', 'andrae', 'danish', 'aust_SA', 'GRS67', 'GSK2011', 'bessel', 'bess_nam', 'clrk66', 'clrk80', 'clrk80ign', 'CPM', 'delmbr', 'engelis', 'evrst30', 'evrst48', 'evrst56', 'evrst69', 'evrstSS', 'fschr60', 'fschr60m', 'fschr68', 'helmert', 'hough', 'intl', 'krass', 'kaula', 'lerch', 'mprts', 'new_intl', 'plessis', 'PZ90', 'SEasia', 'walbeck', 'WGS60', 'WGS66', 'WGS72', 'WGS84', 'sphere', '-append'); 
load('Ellipsoids.mat'); %Load (other ellisoids from) file Ellipsoids.mat

%Split input
if coordorder == 'latlon' %if coordinate order is set latitude, longitude...
  input(:,[2, 3, 5, 6]) = input(:,[3, 2, 6, 5]); %... swap colums 2 and 3 as well as columns 5 and 6
elseif coordorder ~= 'lonlat' %if coordinate order is also not longitude, latitude...
  disp('Error in input!'); %... give error
end %end of if
inputsize = size(input); %matrix size of input
select = cell2mat(input(:,1)); %first column of input is 1 or 0 for select or deselect
select = select == 1; %make boolean
old = cell2mat(input(:,2:4)); %coordinates of system 1
new = cell2mat(input(:,5:7)); %coordinates of system 2
if exist('pm1','var') %if prime meridian of system 1 is given...
  old(:,1) = old(:,1) + pm1; %... add prime meridian to longitude
else    
  pm1 = 0; %... set prime meridian to zero
end %end of if
if exist('pm2','var') %if prime meridian of system 2 is given...
  new(:,1) = new(:,1) + pm2; %... add prime meridian to longitude
else    
  pm2 = 0; %... set prime meridian to zero
end %end of if
if inputsize(2) == 8 %if 8th is available...
  pointnames = char(input(:,8)); %... use point names
  numbers = 0; %flag
elseif inputsize(2) == 7 %if 8th column isn't available...
  pointnames = num2str((1:inputsize(1))'); %... use numbers as point names
  numbers = 1; %flag
else %if other number of columns...
  disp('Error in input!'); %... give error
end %end of if
oldsel = old(select,:); %coordinates of only the selected points of system 1
newsel = new(select,:); %coordinates of only the selected points of system 2

%Bereken XYZ
oldxyz = ell2cart(old, ellips1); %cartesian coordinates of system 1
newxyz = ell2cart(new, ellips2); %cartesian coordinates of system 2
oldxyzsel = oldxyz(select,:); %cartesian coordinates of only the selected points of system 1
newxyzsel = newxyz(select,:); %cartesian coordinates of only the selected points of system 2

%Bereken 10 transformatieparameters van stelsel 1 naar 2
[parameters, pivot, accuracy, residualsxyzsel] = helmert3d(oldxyzsel, newxyzsel, '10p'); %estimate 10 parameters (10p) to avoid close to singular matrix

%Bereken 7 transformatieparameters van stelsel 1 naar 2
translations = parameters(1:3); %translations for 10 parameters
translations = -d3trafo(pivot, [0; 0; 0; parameters(4:7)])' + translations + pivot'; %translations for 7 parameters: rewriting x2=(1+d)*R*(x1-pivot)+t1+pivot (10-parameter formula) to x2=(1+d)*R*x1+t2 (7-parameter formula) gives t2=-(1+d)*R*pivot+t1+pivot
parameters = [translations; parameters(4:7)]; %replace translations of 10 parameters for those for 7 parameters

%Bereken sluitfouten
residualsxyz = newxyz - d3trafo(oldxyz, parameters); %cartesian residuals are coordinates of system 2 minus transformation of system 2
residuals3d = (residualsxyz.^2 * [1; 1; 1]).^0.5; %compute 3D vector length of residuals using Pythagoras
residuals3dsel = (residualsxyzsel.^2 * [1; 1; 1]).^0.5; %compute 3D vector length of residuals using Pythagoras
residualsgeo = new - cart2ell(newxyz - residualsxyz, ellips2); %lon,lat,h residuals are coordinates of system 2 minus transformation of system 2
residualsgeosel = newsel - cart2ell(newxyzsel - residualsxyzsel, ellips2); %lon,lat,h residuals are coordinates of system 2 minus transformation of system 2
residuals2d = residualsgeo .* [1 1 0]; %lon,lat,0 residuals by setting height to zero
residuals2dsel = residualsgeosel .* [1 1 0]; %lon,lat,0 residuals by setting height to zero
residuals2d = newxyz - ell2cart(cart2ell(newxyz, ellips2) - residuals2d, ellips2); %cartesian residuals based on ellipsoidal height zero
residuals2dsel = newxyzsel - ell2cart(cart2ell(newxyzsel, ellips2) - residuals2dsel, ellips2); %cartesian residuals based on ellipsoidal height zero
residuals2d = (residuals2d.^2 * [1; 1; 1]).^0.5; %compute 2D vector length of residuals using 3D Pythagoras
residuals2dsel = (residuals2dsel.^2 * [1; 1; 1]).^0.5; %compute 2D vector length of residuals using 3D Pythagoras
rmse1d = sqrt(mean(residualsgeo(:,3).^2)); %root mean square height error 
rmse1dsel = sqrt(mean(residualsgeosel(:,3).^2)); %root mean square height error 
rmse2d = sqrt(mean(residuals2d(:).^2)); %root mean square error of 2D vector length
rmse2dsel = sqrt(mean(residuals2dsel(:).^2)); %root mean square error of 2D vector length
rmse3d = sqrt(mean(residuals3d(:).^2)); %root mean square error of 3D vector length
rmse3dsel = sqrt(mean(residuals3dsel(:).^2)); %root mean square error of 3D vector length

%Geef tabel op scherm
head1 = 'RESIDUALS'; %title of output table
col1 = pointnames; %point names in first column of output table
col1 = [col1, repmat(' ',size(col1)*[1;0],length(head1)-size(col1)*[0;1])]; %add spaces if point names are shorter than a table title
col2 = repmat('  ',size(residuals3d)); %column spacing between column with point names and first column with residuals 
col3 = num2str(residualsgeo(:,1), '%+.9f'); %column with signed longitude residuals
col4 = repmat('°  ',size(residuals3d)); %degree unit and column spacing between longitude and latitude residuals
col5 = num2str(residualsgeo(:,2), '%+.9f'); %column with signed latitude residuals
col6 = repmat('°  ',size(residuals3d)); %degree unit and column spacing between latitude and height residuals
col7 = num2str([residualsgeo(:,3); rmse1dsel; rmse1d], '%+.4f'); %column with signed height residuals and adding footer with RMSE
col8 = repmat(' m    ',size(residuals3d)); %metre unit and column spacing between height and 2D residuals
col9 = num2str([residuals2d; rmse2dsel; rmse2d], '%.4f'); %column with 2D residuals and adding footer with RMSE
col10 = repmat(' m  ',size(residuals3d)); %metre unit and column spacing between 2D and 3D residuals
col11 = num2str([residuals3d; rmse3dsel; rmse3d], '%.4f'); %column with 3D residuals and adding footer with RMSE
col12 = repmat(' m  ',size(residuals3d)); %metre unit and column spacing between 3D residuals and deselect markers
col13 = strrep(strrep(num2str(select)', '0', '*'), '1', ' ')'; %column with deselect markers, displaying a * for deselected points (value 0)
col1 = [col1; pad('RMSE excl. *',size(col1)*[0;1]); pad('RMSE incl. *',size(col1)*[0;1])]; %add footer to first column (padding spaces for the correct width)
col2 = [col2; pad('  ',size(col2)*[0;1]); pad('  ',size(col2)*[0;1])]; %add column spacing to footer
col3 = [col3; pad('  ',size(col3)*[0;1]); pad('  ',size(col3)*[0;1])]; %skip longitude in footer
col4 = [col4; pad('° ',size(col4)*[0;1]); pad('° ',size(col4)*[0;1])]; %add column spacing to footer (including the degree sign is needed to get the correct width)
%col4(end-1,:) = strrep(col4(end-1,:), '°', ' '); %remove degree sign in footer
%col4(end,:) = strrep(col4(end,:), '°', ' '); %remove degree sign in footer
col5 = [col5; pad('  ',size(col5)*[0;1]); pad('  ',size(col5)*[0;1])]; %skip latitude in footer
col6 = [col6; pad('° ',size(col6)*[0;1]); pad('° ',size(col6)*[0;1])]; %add column spacing to footer (including the degree sign is needed to get the correct width)
%col6(end-1,:) = strrep(col6(end-1,:), '°', ' '); %remove degree sign in footer
%col6(end,:) = strrep(col6(end,:), '°', ' '); %remove degree sign in footer
col7(end-1,:) = strrep(col7(end-1,:), '+', ' '); %remove plus sign in footer
col7(end,:) = strrep(col7(end,:), '+', ' '); %remove plus sign in footer
col8 = [col8; pad(' m',size(col8)*[0;1]); pad(' m',size(col8)*[0;1])]; %add metre unit and column spacing to footer
col10 = [col10; pad(' m',size(col10)*[0;1]); pad(' m',size(col10)*[0;1])]; %add metre unit and column spacing to footer
col12 = [col12; pad(' m',size(col12)*[0;1]); pad(' m',size(col12)*[0;1])]; %add metre unit and column spacing to footer
col13 = [col13; pad(' ',size(col13)*[0;1]); pad(' ',size(col13)*[0;1])]; %skip deselect marker in footer
head1 = pad(head1,size(col1)*[0;1]); %pad spaces to table title for the correct width
head2 = pad(' ',size(col2)*[0;1]); %add column spacing to header
head3 = pad('LONGITUDE (°)',(size(col3)+size(col4))*[0;1]-1); %header for longitude residuals column (may extend in to spacing with latitide residuals column)
head4 = ' '; %add column spacing to header
head5 = pad('LATITUDE (°)',(size(col5)+size(col6))*[0;1]-1); %header for latitude residuals column (may extend in to spacing with height residuals column)
head6 = ' '; %add column spacing to header
head7 = pad('HEIGHT (m)',(size(col7)+size(col8))*[0;1]-1); %header for height residuals column (may extend in to spacing with 2D residuals column)
head8 = ' '; %add column spacing to header 
head9 = pad('2D (m)',size(col9)*[0;1]); %header for 2D residuals column
head10 = pad(' ',size(col10)*[0;1]); %add column spacing to header
head11 = pad('3D (m)',size(col11)*[0;1]); %header for 3D residuals column
head12 = pad(' ',size(col12)*[0;1]); %add column spacing to header
head13 = 'DESELECT (*)'; %header for column with deselect markers
disp(' ') %display white line in text
disp([head1, head2, head3, head4, head5, head6, head7, head8, head9, head10, head11, head12, head13]); %display header of residuals table
disp([col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13]); %display residuals table including footer

%Check of rotatiehoeken niet te groot zijn
roterror = sum(abs(sin(parameters(4:6)) - parameters(4:6)) * 6378137); %effect ar earth radius of differences between sin(angle) and angle (using naive sum of effect of the 3 rotation angles)

%Check ellipsoide van stelsel 2
ellips = eval(ellips2); %variable ellips is the struct, variable ellips2 is the character string of the name of the struct
ellipserror = max(abs([ellips.a - WGS84.a, ellips.b - WGS84.b])); %maximum difference in radius between the ellipsoid of system 2 and the WGS84 ellipsoid

%Check of ellipsoide in PROJ zit
projellips = ',MERIT,SGS85,GRS80,IAU76,airy,NWL9D,mod_airy,andrae,danish,aust_SA,GRS67,GSK2011,bessel,bess_nam,clrk66,clrk80,clrk80ign,CPM,delmbr,engelis,evrst30,evrst48,evrst56,evrst69,evrstSS,fschr60,fschr60m,fschr68,helmert,hough,intl,krass,kaula,lerch,mprts,new_intl,plessis,PZ90,SEasia,walbeck,WGS60,WGS66,WGS72,WGS84,sphere,'; %list of ellipsoids in PROJ (comma needed at start and end of list)
unknownellips1 = isempty(strfind(projellips,[',', ellips1, ','])); %boolean 1/0 for if ellipsoid of system 1 is not in PROJ
ellips = eval(ellips1); %variable ellips is the struct, variable ellips2 is the character string of the name of the struct
if unknownellips1 == 0 %if ellipsoid of system 1 is in PROJ...
  ellips1 = ['+ellps=', ellips1]; %... use ellipsoid name in PROJ
elseif (ellips.a - ellips.b) < 0.0001 %if unknown ellipsoid of system 1 is a sphere...
  ellips1 = ['+a=', num2str(ellips.a, '%.4f'), ' +b=', num2str(ellips.b, '%.4f')]; %... use parameters a and b of ellipsoid in PROJ
else %if unknown ellipsoid of system 1 is not a sphere...
  ellips1 = ['+a=', num2str(ellips.a, '%.4f'), ' +rf=', num2str(1/ellips.f, '%.6f')]; %... use a and 1/f in PROJ
end %end of if
unknownellips2 = isempty(strfind(projellips,[',', ellips2, ','])); %boolean 1/0 for if ellips of system 2 is in PROJ
ellips = eval(ellips2); %variable ellips is the struct, variable ellips2 is the character string of the name of the struct
if unknownellips2 == 0 %if ellipsoid of system 2 is in PROJ...
  ellips2 = ['+ellps=', ellips2]; %... use ellipsoid name in PROJ
elseif abs(ellips.a - ellips.b) < 0.0001 %if unknown ellipsoid of system 2 is a sphere...
  ellips2 = ['+a=', num2str(ellips.a, '%.4f'), ' +b=', num2str(ellips.b, '%.4f')]; %... use parameters a and b of ellipsoid in PROJ
else %if unknown ellipsoid of system 2 is not a sphere...
  ellips2 = ['+a=', num2str(ellips.a, '%.4f'), ' +rf=', num2str(1/ellips.f, '%.6f')]; %... use a and 1/f in PROJ
end %end of if

%Voeg extra stap toe voor nulmeridiaan ongelijk aan nul
if abs(pm1) < 0.000000001 %if prime meridian is zero...
    pm1text = ''; %... no extra step is needed
else 
    pm1text = [' +step +proj=longlat +pm=', num2str(pm1, '%.9f'), ' +inv']; %... extra step for prime meridian of system 1
end %end of if
if abs(pm2) < 0.000000001 %if prime meridian is zero...
    pm2text = ''; %... no extra step is needed
else
    pm2text = [' +step +proj=longlat +pm=', num2str(pm2, '%.9f')]; %... extra step for prime meridian of system 2
end %end of if

%Parameters in de gewenste eenheden (m m m " " " ppm)
towgs84par = (parameters - [0; 0; 0; 0; 0; 0; 1]) .* [1; 1; 1; -180*3600/pi; -180*3600/pi; -180*3600/pi; 1000000]; %convert rotations to asrcsec minus (signs for postion vector convention) and scale to ppm 
disp(' '); %display white line in text
disp('PROJ4 string'); %display heading
disp(['+proj=longlat ', ellips1, ' +towgs84=', num2str(towgs84par(1), '%.4f'), ',', num2str(towgs84par(2), '%.4f'), ',', num2str(towgs84par(3), '%.4f'), ',', num2str(towgs84par(4), '%.6f'), ',', num2str(towgs84par(5), '%.6f'), ',', num2str(towgs84par(6), '%.6f'), ',' ,num2str(towgs84par(7), '%.5f'), ' +pm=', num2str(pm1, '%.9f')]); %display PROJ4 string
if roterror > 0.0001 %if the predicted rotation error for PROJ4 is larger than 0.1 mm...
  disp(['NB: De rotatiehoeken zijn zo groot dat PROJ4 fouten geeft van ca. ', num2str(roterror, '%.4f'), ' m']); %... display warning for large rotation angle, including predicted error
end %end of if
if or(round(ellipserror*10000) > 1,  abs(pm2) > 0.000000001) %if the ellipsoid or prime meridian of system 2 is not that of WGS84...
  disp(['NB: De ellipsoide en/of nulmeridiaan van stelsel 2 moeten in een afzonderlijke PROJ4 string gespecificeerd worden:']); ... display warning for ignoring prime meridian of system 2
  disp(['+proj=longlat ', ellips2, ' +towgs84=0,0,0,0,0,0,0 +pm=', num2str(pm2, '%.9f')]); %display PROJ4 string of system 2
end %end of if
disp(' '); %display white line in text
pipeline = ['+proj=pipeline', pm1text, ' +step +proj=cart ', ellips1, ' +step +proj=helmert +convention=coordinate_frame +exact +x=', num2str(towgs84par(1), '%.4f'), ' +y=', num2str(towgs84par(2), '%.4f'), ' +z=', num2str(towgs84par(3), '%.4f'), ' +rx=', num2str(-towgs84par(4), '%.6f'), ' +ry=', num2str(-towgs84par(5), '%.6f'), ' +rz=' ,num2str(-towgs84par(6), '%.6f'), ' +s=' ,num2str(towgs84par(7), '%.5f'), ' +step +proj=cart +inv ', ellips2, pm2text]; %create text string of PROJ pipeline
disp('PROJ pipeline'); %display heading
disp(pipeline); %display PROJ4 pipeline
disp(' '); %display white line in text

%Plot sluitfouten
figure('name','Horizontal (red) and vertical (blue) residuals at selected (black) and deselected (yellow) points'); %set figure description in title
%Punten in pseudomercatorprojectie
hold on; %allow multiple plots in one figure
R = 6370997.0; %earth radius for pseudo-mercator projection
x = R * new(:,1)/180*pi; %x-coordinates of all points in pseudo-mercator projection
y = R * log(tan(pi/4 + new(:,2)/2/180*pi)); %y-coordinates of all points in pseudo-mercator projection
xsel = x(select); %x-coordinates of selected points in pseudo-mercator projection
ysel = y(select); %y-coordinates of selected points in pseudo-mercator projection
trianglesize = 5; %SETTING: symbol size for points in the plot
plot(x, y, '^', 'color', 'black', 'MarkerFaceColor', 'yellow', 'MarkerSize', trianglesize); %plot all points as yellow triangles
plot(xsel, ysel, '^', 'color', 'black', 'MarkerFaceColor', 'black', 'MarkerSize', trianglesize); %plot selected points as black triangles
set(gca,'XColor', 'white', 'YColor', 'white'); %set axis colour to hide the coordinate axis
set(gcf,'color', 'white'); %set background colour to same colour as plot
axis equal; %set same scale for x and y 
xrange = xlim; %minimum and maximum x-coordinate
range = xrange(2)-xrange(1); %horizontal size of plot in metres (in pseudo-mercator projection)
textoffset = 0.003; %SETTING: horizontal point label offset as fraction of figure size
namelength = 3; %SETTING: maximum number of displayed characters of point names in the plot
textsize = 10; %SETTING: point label in the plot
namesize = size(pointnames); %length of longest point name
namelength = min(namelength,namesize(2)); %number of displayed characters of point names in plot
if numbers == 0 %if numbers flag is not set...
  text(x+range*textoffset,y,pointnames(:,1:namelength), 'FontSize', textsize); %... plot first characters of point name labels
else %if numbers flag is set...
  text(x+range*textoffset,y,pointnames(:,end-namelength+1:end), 'FontSize', textsize); %... plot last digits of point name labels
end %end of if
%Horizontale sluitfouten in pseudomercatorprojectie
hold on; %allow multiple plots in one figure
vectorscale = 0.02; %SETTING: length of average vector as fraction of figure size
vector = new - residualsgeo/rmse3d*vectorscale*range; %coordinates of the end point of the 2D residual vectors in degrees (unit = (deg/m)*unitless*m)
vectorsel = newsel - residualsgeosel/rmse3d*vectorscale*range; %selected coordinates of the end point of the 2D residual vectors in degrees (unit = (deg/m)*unitless*m)
vectorlon = [new(:,1)'; vector(:,1)'; nan([1, length(new)])]; %longitude of start and end of each 2D residual vector (sepatated by a NaN value)
vectorlat = [new(:,2)'; vector(:,2)'; nan([1, length(new)])]; %latitude of start and end of each 2D residual vector (sepatated by a NaN value)
vectorlonsel = [newsel(:,1)'; vectorsel(:,1)'; nan([1, length(newsel)])]; %selected longitude of start and end of each 2D residual vector (sepatated by a NaN value)
vectorlatsel = [newsel(:,2)'; vectorsel(:,2)'; nan([1, length(newsel)])]; %selected latitude of start and end of each 2D residual vector (sepatated by a NaN value)
x = R * vectorlon(:)/180*pi; %x-coordinate (in pseudo-mercator projection) of start and end of each 2D residual vector (sepatated by a NaN value)
y = R * log(tan(pi/4 + vectorlat(:)/2/180*pi)); %y-coordinate (in pseudo-mercator projection) of start and end of each 2D residual vector (sepatated by a NaN value)
xsel = R * vectorlonsel(:)/180*pi; %selected x-coordinate (in pseudo-mercator projection) of start and end of each 2D residual vector (sepatated by a NaN value)
ysel = R * log(tan(pi/4 + vectorlatsel(:)/2/180*pi)); %selected y-coordinate (in pseudo-mercator projection) of start and end of each 2D residual vector (sepatated by a NaN value)
plot(x, y, 'color', [1, 0.9, 0]); %plot 2D residual vectors (orange)
plot(xsel, ysel, 'color', 'red'); %plot selected 2D residual vectors
%Verticale sluitfouten in pseudomercatorprojectie
hold on; %allow multiple plots in one figure
heightexaggeration = 1; %SETTING: exaggeration factor to visualise very small (or very large) vertical residuals
heightvectorscale = vectorscale/pi/R*180*heightexaggeration; %adjusted scale for height vectors (unit = (unitless/m)*deg*unitless = deg/m)
vectorlon = [new(:,1)'; new(:,1)'; nan([1, length(new)])]; %longitude of start and end of each residual height vector (sepatated by a NaN value)
vectorlat = [new(:,2)'; new(:,2)'-residualsgeo(:,3)'/rmse3d*heightvectorscale*range; nan([1, length(new)])]; %latitude of start and end of each residual height vector (sepatated by a NaN value)
vectorlonsel = [newsel(:,1)'; newsel(:,1)'; nan([1, length(newsel)])]; %selected longitude of start and end of each residual height vector (sepatated by a NaN value)
vectorlatsel = [newsel(:,2)'; newsel(:,2)'-residualsgeosel(:,3)'/rmse3d*heightvectorscale*range; nan([1, length(newsel)])]; %selected latitude of start and end of each residual height vector (sepatated by a NaN value)
x = R * vectorlon(:)/180*pi; %x-coordinate (in pseudo-mercator projection) of start and end of each residual height vector (sepatated by a NaN value)
y = R * log(tan(pi/4 + vectorlat(:)/2/180*pi)); %y-coordinate (in pseudo-mercator projection) of start and end of each residual height vector (sepatated by a NaN value)
xsel = R * vectorlonsel(:)/180*pi; %selected x-coordinate (in pseudo-mercator projection) of start and end of each residual height vector (sepatated by a NaN value)
ysel = R * log(tan(pi/4 + vectorlatsel(:)/2/180*pi)); %selected y-coordinate (in pseudo-mercator projection) of start and end of each residual height vector (sepatated by a NaN value)
plot(x, y, 'color', 'cyan'); %plot selected residual height vectors
plot(xsel, ysel, 'color', 'blue'); %plot residual height vectors

end %end of function