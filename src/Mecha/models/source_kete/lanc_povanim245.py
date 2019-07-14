#!BPY

""" Registration info for Blender menus: <- these words are ignored
Name: 'Povanim 2.45-01'
Blender: 244
Group: 'Export'
Tip: 'Export to povray/megapov/mlpov/subpov (.pov/.ini) format.'
"""
__author__ = "jean-michel  Soler"
__url__ = ("blender", "elysiun", "Page officielle/offcial page :  http://jmsoler.free.fr/util/blenderfile/povanim.htm",
	"Communiquer les problemes et erreurs sur / To Communicate problems and errors on:   http://www.zoo-logique.org/3D.Blender/newsportal/thread.php?group=3D.Blender")
__version__ = "2.45_01 2007-10-01"
__bpydoc__ = """\
#-----------------------------------------------------#
#
# Page officielle/official page :render
#
#   http://jmsoler.free.fr/util/blenderfile/povanim.htm
# Communiquer les problemes et erreurs sur:
# To Communicate problems and errors on:
#   http://www.zoo-logique.org/3D.Blender/newsportal/thread.php?group=3D.Blender
#                    (c) jm soler 04/2002-->10/2007                    
# 
# 
# Official page, http://jmsoler.free.fr/util/blenderfile/fr/povanim_en.htm
# Questions and probles, http://www.zoo-logique.org/3D.Blender/newsportal/thread.php?group=3D.Blender
#
#-----------------------------------------------------#
# Exporter for povray 3.5/3.6, Graphic User Interface # 
# ----------------------------------------------------#
# These files, lanc_povanim.py and povanimxxx.pyo/pyc
# are :                                               
#                                                                    
#      (c) jm soler 02/2002-->10/2007                    
#
# They are not Open Source and not GPL,  just free for
# use only .     
# This program is distributed in the hope that it will 
# be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A 
# PARTICULAR PURPOSE.
#
#-----------------------------------------------------#
#-----------------------------------------------------# 
#    ATTENTION               
#-----------------------------------------------------# 
# BEFORE USING THIS SCRIPT PAY ATTENTION TO THE PLACE
# WHERE YOU PUT THE .PYO/.PYC PART,(the compiled part
# of the script). THERE ARE TWO POSSIBLE CHOICES (one
# more, perhaps, with  blender2.32):                 
#
#    1/ in the blender executable directory    
#
#    2/ in the directory of the exported file        
#
#    3/ in the .blender/scripts  folder  pointed by 
#        the python path in the Info window.         
#
# DO NOT FORGET TO LOAD THIS SCRIPT AND DO "alt-p"(maybe 
# twice). And be patient...                          
#-----------------------------------------------------# 
#    CAUTION  BIS
#-----------------------------------------------------#
#  go to line 363 (or somewhere near this line, you can 
#  do also twice an alt-f on "please document" to find 
#  the exact 
#  location, and document to modify the renderer folder 
#  path and line  the renderer name           
#  
#  Do not forget to render at least one time your current 
#  blender file and do not forget too save this file too.
#  because you have to chose the export directory where
# povanim will  save all its files.
#
#-----------------------------------------------------# 
#    CAUTION  3th
#-----------------------------------------------------#
# ANIMATION:                                                         
# To export full animation you need at least one OPENED 3
# 3D WINDOW    # 
#
#-----------------------------------------------------# 
#    CAUTION 4th
#-----------------------------------------------------#
#-----------------------------------------------------#
#-----------------------------------------------------#
# Interface Graphique pour l' exporteur vers povray 3.5,  
#
# ces fichiers , lanc_povanim.py and povanimxxx.pyo/pyc sont:
#                                                           
#                    (c) jm soler 02/2002-->4/2007          
#
# Ils ne sont ni Open Source and ni GPL,  juste libre pour 
# l'usage personnel.                                       
#-----------------------------------------------------# 
#    ATTENTION               
#
# AVANT D4UTILISER CE SCRIPT PRENNEZ GARDE A L4ENDROIT OU V
# VOUS # INSTALLEREZ LA PARTIE  .PYO/.PYC ,(LA PARTIE COMPILEE
# DU SCRIPT).  
# IL Y A¨PLUSIEURS CHOIX POSSIBLES                            
#                                                             
#    1/ dans le repertoire du fichier executif de blender     
#    2/ dans le repertoire du fichier exporte                 
#    3/ dans le repertoir .blender/scripts                    
#                                                             
# NE PAS OUBLIER DE LANCER CHARGER LE SCRIPT DANS LA FENETRE 
# ADAPTE ET UTILER LA COMBINAISON DE TOUCHE  "alt-p".       
#                                                           
#-----------------------------------------------------------
#    ATTENTION BIS
#-----------------------------------------------------------
#  ALLER A LA LIGNE 363 DE CE DOCUMENT POUR MODIFIER L ADRESSE 
#  DU REPERTOIRE DE POVRAY ET UN PEU PLUS LOIN LES NOMS DES 
#  FICHIERS EXE QUE VOUS COMPTER UTILISER POUR LE RENDU : POVRAY
#  , MEGAPOV OU MLPOV                                                  
# 
#   profile : l'activation de chargement de l'ancien profil se 
#   fait en basculant la variable OLDPROFIL sur 1  
#-----------------------------------------------------# 
#    ATTENTION TER
#
# ANIMATION:
# pour exporter une animation il doit y avoir au moins une 
# fenetre 3D 
# ouverte.  
# 
"""
#--------------------------------------------------------------------#
# -*- coding: utf-8 -*-
#--------------------------------------------------------------------#
debug=1

FRENCH=0
POVANIMVERSION='povanim245_03'
POVENGINE={'v3.5':'','v3.6':'','v3.7':''}
DISQUE='C'

BLENDERDIR='tmp'
FILENAME='untitled.blend'
FILEDIR=DISQUE+':\\'+BLENDERDIR+'\\'+FILENAME

CONTROL3DVIEW=0

MAINGUI=1
RADIOSITYGUI=2
PHOTONSGUI=3
MATERIALSGUI=4
RENDERGUI=5
OTHERSSTTINGSGUI=6
PATHSGUI=7
POSTPROCESSGUI=8

MEGAPOV=23
POSTPROCESSBUTTON=24

PHOTONONBUTTON=26
ANIMCAMERABUTTON=27

ANIMMATERIALBUTTON=28
ANIMLAMPBUTTON=29
DOANIMBUTTON=30
STARTFRAMEBUTTON=31
ENDFRAMEBUTTON=32

UVGLOBALWEIGHT=31
REFLECTIONGLOBALWEIGHT=33

POVRAYMENU=519
MEGAPOVMENU=513

PROFILESBUTTON=610
RESPROFILESBUTTON=612 
DIAMETREBUTTON=613 # wire bloc
FOCALBLUR=630

RENDERBUTTON=714   # main window

import sys
import Blender
BL_VERSION=Blender.Get('version')
print  BL_VERSION
import Blender.Draw
from Blender.Draw import *
import Blender.BGL
from Blender.BGL import *

cvs=0

P2=0


#--------------------------------
# -- pvm button  : 
#--------------------------------
PVM=1

#--------------------------------
# Useful to recover  the original sys 
# state
#--------------------------------
oldsys=sys.path[:]

#--------------------------------
# For Mac users if they want to test
# the MacMegapov 1.0
#--------------------------------
MacOS='no' # please document this line  'yes'/'no'
if MacOS=='yes':
   if sys.version.find('2.2.')!=-1:
      name = "MacOS :%t|this script does not work with python 2.2, try to use an older version"  
      result = Blender.Draw.PupMenu(name)
   elif sys.version.find('2.3.')!=-1:
      name = "MacOS :%t| this script does not work with python 2.3, try to use an older version"  
      result = Blender.Draw.PupMenu(name)
   elif sys.version.find('2.4.')!=-1:
      name = "MacOS :%t| this script needs python 2.4, paths added to sys.path"  
      result = Blender.Draw.PupMenu(name)
      sys.path.extend(['', 
                       '/usr/lib/python2.4', 
                       '/usr/lib/python2.4/plat-darwin', 
                       '/usr/lib/python2.4/lib-tk', 
                       '/usr/lib/python2.4/lib-dynload', 
                       '/usr/lib/python2.4/site-packages']) 
      
#--------------------------------
# correction du 05/23 
#--------------------------------
# -- Avoid to load os module from 
#    python's libraries. Problem with
#    2.3 python version. use 232_03
#    instead.
#--------------------------------
try:
  import nt
  os=nt
  os.sep='\\'
  #--------------------------------
  # Pour reperer les adresses des images uvmappees
  # dans le disque d'origine de blender car... 
  #--------------------------------
  n=1
  ok=1
  exepath=sys.executable
  print exepath
  DISQUE=exepath[0]
  print DISQUE,'....'
  import _winreg 
  for pov in POVENGINE.keys() :
    try :
        key =  _winreg.QueryValueEx(_winreg.OpenKey( _winreg.HKEY_CLASSES_ROOT,'POV-Ray.Scene\DefaultIcon'),'')
        tmp = str(key).replace("(u'","").replace("')","").split(",")[0].replace("\\\\POV-Ray.Scene.ico'",'')
        if pov in tmp : POVENGINE[pov] = tmp
        print 'valeur',POVENGINE[pov]
    except :
      print 'not found %s ...'%pov

except:
  import posix
  os=posix
  os.sep='/'
  DISQUE='home'
  FILEDIR=os.sep+DISQUE+os.sep+BLENDERDIR+os.sep
  
#--------------------------------
# correction du 05/23 /fin >
#--------------------------------
# -- Get local filename and
#    folder
#--------------------------------
L=sys.path
ls=Blender.Get('filename')
print ' debug paths : FILENAME', ls

#--------------------------------
# correction du 07/01 Quit
print 'os.sep', os.sep
if ls.find(os.sep)!=-1:
    k0=ls.split(os.sep)
    print 'paths control : k0,', k0
else:
    k0=ls.split('/') 
    print 'paths control : k0 , ', k0
	
print 'paths control : k0[-1] ,', k0[-1]
	
if ls: ls=ls.replace(k0[-1],'')
else: ls = DISQUE+'\\'
		

print 'paths control : ls  ,', ls
	
# correction du 05/23 /fin >

if ls and ls[:-1] not in sys.path:
   sys.path.append(ls[:-1])

print ' debug paths : FILEDIR', ls

bpydata=Blender.Get('datadir')
print ' debug paths : BPYDATA', bpydata

try:
   povanimini=open(bpydata+'povanim.ini','r')
   povanimfolder=povanimini.readline()
   povanimini.close()
   if os.stat(povanimfolder):
      sys.path.append(povanimfolder)
except:
   povanimfolder=FILEDIR
   
def walktree(top,povanim):
    '''recursively descend the directory tree rooted at top,
       to add the povanim folder to the sys.path'''
    global pathOK,povanimfolder
    if povanim in os.listdir(top):
           sys.path.append(top)
           pathOK=1
           povanimfolder=top
           povanimini=open(bpydata+'povanim.ini','w')
           povanimini.write(povanimfolder)
           povanimini.close()
           return 
    elif not pathOK:
     for f in os.listdir(top):
         pathname = os.path.join(top, f)
         mode = os.stat(pathname)[ST_MODE]
         if S_ISDIR(mode):
            # It's a directory, recurse into it
            print pathname
            walktree(pathname,povanim)

if not debug:
         try:
               exec "import %s"%POVANIMVERSION
               exec "reload(%s)"%POVANIMVERSION
               exec "from %s import *"%POVANIMVERSION
               exec "xptrueA_=%s"%POVANIMVERSION
         except:
            if FRENCH:
               nameproblem="Povanim ne trouve pas ses librairies de fonctions, voulez-vous : %t| ... entrer bon repertoire ?  %x1 | ... laisser le script tenter de trouver seul, entrez la lettere du disque  %x2 | (conseil: copiez  %s dasn le repertoire .blender/scripts folder) %x3"%(POVANIMVERSION+'.pyc')
            else:   
               nameproblem = "Povanim can't find its functions library, you can : %t| ... enter the correct folder  %x1 | ... let the script try to find by itself, just enter the root disk/folder %x2 | (Advice: copy %s in the .blender/scripts folder) %x3"%(POVANIMVERSION+'.pyc')
            result = Blender.Draw.PupMenu(nameproblem)
            povanimfolder=sys.executable
            pathOK=0
            if result==1:
               from stat import *
               while not pathOK: 
                  povanimfolder=sys.executable
                  povanimfolder=Blender.Draw.PupStrInput(" Folder:",povanimfolder, 100)
                  mode = os.stat(povanimfolder+Blender.sys.sep+POVANIMVERSION+".pyc")[ST_MODE]        
                  if S_ISREG(mode):
                     pathOK=1
                     sys.path.append(povanimfolder)
                     povanimini=open(bpydata+'povanim.ini','w')
                     povanimini.readline(povanimfolder)
                     povanimini.close()
            if result==2:
               if disque :
                   top=disque+':'+Blender.sys.sep
               else  : 
                   top=Blender.sys.sep
               top=Blender.Draw.PupStrInput(" Enter root :",top, 100)
               from stat import *
               import os.path 
               walktree(top,POVANIMVERSION+'.pyc')
               
            if pathOK   :
               nameproblem = "Povanim message:  you have to relaod the script  %t| Now  %x1 "
               result = Blender.Draw.PupMenu(nameproblem)
               exec "import %s"%POVANIMVERSION
               exec "reload(%s)"%POVANIMVERSION
               exec "from %s import *"%POVANIMVERSION
               exec "xptrueA_=%s"%POVANIMVERSION
           
else:
               exec "import %s"%POVANIMVERSION
               exec "reload(%s)"%POVANIMVERSION
               exec "from %s import *"%POVANIMVERSION
               exec "xptrueA_=%s"%POVANIMVERSION
      
#--------------------------------
# -- reperage du disque local du fichier 
# binaire de blender
# -- useful on win32 system for some data stocked 
# on the same disk as blender binary 
#-------------------------------- 
try:
  if os == nt: 
     xptrueA_.BLENDERDISQUE=DISQUE
     xptrueA_.SEP='\\'
except:
     xptrueA_.SEP='/'

#--------------------------------
# -- if you are using cvs compil not the official blender
# --------------------------------
xptrueA_.CVS=cvs
   
#--------------------------------
# -- Get new profile functions and button from 
#    povanim
#--------------------------------
OVERLOADPROFIL=1

#--------------------------------
# -- Try to load profile for the current 
#    file
#--------------------------------
OLDPROFIL=0

try:
   #--------------------------------
   # chargement normal du profil
   # normal profil download
   #-------------------------------- 
   if not OVERLOADPROFIL:
      prf=profil(1,ls+os.sep+"profilstnd.prfl")
      prf.prf_load()
      for prf_n in prf.povanimlist:
         exec '%s=prf.%s'%(prf_n,prf_n)
   else:
      #--------------------------------
      # nouvelle liste  prenant en compte les nouveaux boutons
      # new list for new buttons
      #--------------------------------
      prf=profil(0,ls+Blender.sys.dirsep+"profilstnd.prfl")
      for prf_n in prf.povanimlist:
          exec '%s=prf.%s'%(prf_n,prf_n)

      #--------------------------------
      # on essaye de surchager avec les anciennes valeurs
      # we try to get the old value of the profil file
      #--------------------------------
      if OLDPROFIL: 
         prf.prf_load()
         for prf_n in prf.povanimlist:
             exec '%s=prf.%s'%(prf_n,prf_n)

except:
   prf=profil(0,ls+Blender.sys.dirsep+"profilstnd.prfl")
   for prf_n in prf.povanimlist:
      exec '%s=prf.%s'%(prf_n,prf_n)

#-------------------------------------------
# please document : renderer binary folder path
#-------------------------------------------

if os.sep=='/': # posix : linux/mac/irix
   prf.megapov10Path="/home/3d/megapov10"
   prf.mlpov08Path="/home/3d/mlpov"
   prf.povray35Path="/home/jms/3d/povray/povray-3.5"
   prf.povray36Path="/home/jms/3d/povray/povray-3.5"
   prf.megapov07Path="/home/3d/megapov07"
   prf.povraySubPath="Sorry, this patch does not exist for *nix"
   prf.MechsimPath="/home/3d/megapov10"
   
else: # win32 : win98,nt,xp
   prf.megapov10Path="D:\\stock_logiciel\\povray\\megapov-1.2-windows\\bin"
   prf.mlpov08Path=" "
   prf.povray35Path=" "
   prf.povray36Path=" "
   prf.megapov07Path="F:\\Program Files\\POV-Ray for Windows v3.1\\bin"
   prf.povraySubPath=" "
   prf.mechsimPath="G:\\stock_logiciel_et_plugin\\3d\\povray\\megapov\\bin"
   if POVENGINE['v3.5']!='':
      prf.povray35Path=POVENGINE['v3.5'].replace('\\\\','\\') 
      prf.mlpov08Path==POVENGINE['v3.5']
   if POVENGINE['v3.6']!='':
      prf.povray36Path=POVENGINE['v3.6']

   
# correction du 05/24 
povpath=['povray35Path',
         'povray36Path',
         'megapov07Path',
         'mlpov08Path',
         'megapov10Path',
         'povraySubPath',
         'mechsimPath']


for n in range(len(povpath)):
      exec '%s=prf.%s'%(povpath[n],povpath[n])
# correction du 05/24 /fin >

#-------------------------------------------
# please document : renderer binary name
#-------------------------------------------
if os.sep=='/': # posix : linux/mac
   prf.megapov10Name="megapov"
   prf.megapov07Name="megapov"
   prf.mlpov08Name="mlpov"
   prf.povray35Name="povray"
   prf.povray36Name="povray"
   prf.povraySubName="povray_sub"
   prf.mechsimName="megapov"

else:  # win32 . win98/nt/2000/xp
   prf.megapov10Name="mpengine.exe"
   prf.megapov07Name="megapov.exe"
   prf.mlpov08Name="mlpov.exe"
   prf.povray35Name="pvengine.exe"
   prf.povray36Name="pvengine.exe"
   prf.povraySubName="pvengine.exe"
   prf.mechsimName="megapov.exe"

# correction du 05/24/03
povname=['megapov10Name',
         'megapov07Name',
         'mlpov08Name',
         'povray35Name',
         'povray36Name',
         'povraySubName',
         'mechsimName']

#
for n in range(len(povname)):
      exec '%s=prf.%s'%(povname[n],povname[n])

# correction du 05/24/03 /fin >
prf.renderPath=[prf.povray35Path,
                prf.povray36Path,
                prf.megapov07Path,
                prf.mlpov08Path,
                prf.megapov10Path,
                prf.povraySubPath,
                prf.mechsimPath]
   
prf.renderName=[prf.povray35Name,
                prf.povray36Name,
                prf.megapov07Name,
                prf.mlpov08Name,
                prf.megapov10Name,
                prf.povraySubName,
                prf.mechsimName]

renderPath=prf.renderPath
renderName=prf.renderName

P_PATH=[]
# correction du 05/24/03 /fin >
for p_path in renderPath:
   print "p_path",p_path
   P_PATH.append([Blender.Draw.Create(renderName[renderPath.index(p_path)]),
                  Blender.Draw.Create(p_path), Blender.Draw.Create(0)])

if BL_VERSION==225 or BL_VERSION==226:
   prf.ver='225i.12'
elif BL_VERSION==227:
   prf.ver='227.04'
elif BL_VERSION>=228 and BL_VERSION<233 and xptrueA_.CVS==0:
   prf.ver='232.02'
elif BL_VERSION==233  and xptrueA_.CVS==0:
   prf.ver='233.01f'
elif BL_VERSION>=234 and xptrueA_.CVS==0:
   prf.ver=POVANIMVERSION.replace('povanim','').replace('_','.')
   
## correction du 28/24/04
elif BL_VERSION>=228 and BL_VERSION<=232 and xptrueA_.CVS==1:
   try:
     if P2==2:
       prf.ver='232.CVSP2'
     elif P2==3:
      prf.ver='232.CVSP3'
   except:
      raise "CVS problem"
## correction du 28/24/04 /fin >
   
elif BL_VERSION==223:
   prf.ver='223.17'

# correction du 05/24
ver=prf.ver 
# correction du 05/24 /fin >

#--------------------------------------------------------
#  Radiosity buttons
#--------------------------------------------------------
def clean(B,r):
 return  B[r][0].replace('\t\t\t ','')

Dradiosity={}
Tgradiosity={}

#--------------------------------------------------------
#  Radiosity default values
#--------------------------------------------------------
D_defrad=xptrueA_.D_defrad

def Tgradiosity_state(state):
   global Dradiosity,  Tgradiosity
   for r in range(1,len(G_rad)-1):
     Cr=clean(G_rad,r)
     if Cr!='media' and Cr!='normal':  
         if state=='create':
            Dradiosity[Cr]=Create(G_rad[r][1])
         else:
            Dradiosity[Cr].val=prf.G_rad[r][1]
     else:
        if G_rad[r][1]=='off':
           val=0
        else:
           val=1
        if state=='create':
              Dradiosity[Cr]=Create(val)
        else:   
              Dradiosity[Cr].val=val

   for r in range(1,len(G_rad)-1):
     Cr=clean(G_rad,r)
     if Cr!='media' and Cr!='normal':   
        if state=='create':
           Tgradiosity[Cr]=Create(G_rad[r][4])
        else:
           Tgradiosity[Cr].val=prf.G_rad[r][4]
       
         
Tgradiosity_state('create')

TAmbient_light=Create(tAmbient_light)
SAmbient_light=Create(sAmbient_light)

TMax_trace_level=Create(tMax_trace_level)
SMax_trace_level=Create(sMax_trace_level)

TAmbient=Create(tAmbient)
TMiroir=Create(tMiroir)

#--------------------------------
# -- pvm button  : 
#--------------------------------
tPvm=0
TPvm=Create(tPvm)

#--------------------------------
# -- image exported type button  : 
#-------------------------------- 
MImgOutputType=Create(1)
imageOutputMenu=xptrueA_.imageOutputMenu
imageOutputTips=xptrueA_.imageOutputTips
Nbitperplane=Create(8)


#--------------------------------
# -- Pas de retour ecrit dans la console
# -- no printing in the console 
#-------------------------------- 
TVerbose=Create(tVerbose)
xptrueA_.VERBOSE=int(tVerbose)

#--------------------------------
# -- Forcer le controle des vertex paint, 
#     plus rapide en valeur egale a 0
# -- force vertex paint control : for speed 
#    set the value de 0   
#-------------------------------- 
TVertexCol=Create(tVertexCol)
xptrueA_.VERTEXCOL=int(tVertexCol)

#--------------------------------
# -- Forcer la transparence des images, 
#     meme s'il n'y a ps de couche alpha
# -- force translucence of the images 
#    withon alpha channel
#-------------------------------- 
TTransmitAll=Create(tTransmitAll)
xptrueA_.TRANSMITALL=int(tTransmitAll)

#--------------------------------------------------------
# Wire Type
#--------------------------------------------------------
exec xptrueA_.Wire_Type

#--------------------------------------------------------
# Special format export to make easier the writing of user
# materials
#--------------------------------------------------------
TCompleteMaterial=Create(tCompleteMaterial)
xptrueA_.COMPLETEMATERIAL=int(tCompleteMaterial)

#--------------------------------------------------------
#  photons buttons
#--------------------------------------------------------
Dphotons={}
Tgphotons={}

def Tgphotons_state(state):
   global Dphotons, Tgphotons, prf
   for r in range(1,len(G_phot)-1):
      if G_phot[r][1]!='off':
         if state=="create":
            Dphotons[clean(G_phot,r)]=Create(G_phot[r][1])
         else:
            Dphotons[clean(G_phot,r)].val=prf.G_phot[r][1]
      else:
         if state=="create":
             Dphotons[clean(G_phot,r)]=Create(0)
         else:    
             Dphotons[clean(G_phot,r)].val=prf.G_phot[r][1]
             
   for r in range(1,len(G_phot)-1):
         if state=="create":
            Tgphotons[clean(G_phot,r)]=Create(G_phot[r][4])
         else:
            Tgphotons[clean(G_phot,r)].val=prf.G_phot[r][4]
            
Tgphotons_state('create')
   

#--------------------------------------------------------
#  Extra light
#--------------------------------------------------------
TFadeDistance=Create(FadeDistance)
TFadePower=Create(FadePower)

TlightPower=Create(tlightPower)
SlightPower=Create(lightPower)

#--------------------------------------------------------
#  Extra material
#--------------------------------------------------------
TnumExtMat=300

TGlobRefl=Create(tGlobRefl)
TGlobMapVal=Create(tGlobMapVal)
TGlobPaintVal=Create(tGlobPaintVal)

TGlobBrilliance=Create(tGlobBrilliance)
TGlobAmbient=Create(tGlobAmbient)
TGlobDiffuse=Create(tGlobDiffuse)

SGlobRefl=Create(sGlobRefl)
SGlobMapVal=Create(sGlobMapVal)
SGlobPaintVal=Create(sGlobPaintVal)

SGlobBrilliance=Create(GlobBrilliance)
SGlobAmbient=Create(GlobAmbient)
SGlobDiffuse=Create(GlobDiffuse)

#--------------------------------------------------------
#  Extra material : uvmapped img 
#--------------------------------------------------------

TInterpol=Create(Interpol)
TInterpolType=Create(InterpolType)

#--------------------------------------------------------
#  Extra material : material design interface
#--------------------------------------------------------
TModifMaterial=Create(0)
TGlobalWeight=Create(1)

butt=xptrueA_.buttons(dim[0],dim[1],dim[2],dim[3],boardBlimit)
butt.analyse_structure()
butt.create_buttons()

xptrueA_.shown_object='pigment'
xptrueA_.MATLIST, xptrueA_.MATcorNameLIST, xptrueA_.MATNameLIST, menumaterial=xptrueA_.getmat(xptrueA_.Extramat)
Mmaterial=Create(1)

#--------------------------------------------------------
#  Extra material : auto bumpmapper
#--------------------------------------------------------
TAutoBump=Create(0)
SautoBumpsize=Create(1.0)

#--------------------------------------------------------
#  MEGAPOV 0.7 only : Postprocess
#--------------------------------------------------------
Mpostprod=Create(1)
Sfindedges=Create(0)
Sposterize=Create(0)
Sfocalblur=Create(0)

#--------------------------------------------------------
#  MEGAPOV 0.7 only : find edges buttons
#--------------------------------------------------------
DpostP0={}
def clean2(B,r):
   N=B[r][0].replace(',//',''); 
   if N.find('//')!=-1:
      N=N.replace('//','')
   return N.replace(' \n\t\t\t\t ','')

def clean3(B,r):
   N=B[r][0].replace('\t\t\t ','')
   return N.replace(' {','')
   
for r in range(1,len(G_postP0)-2):
    DpostP0[clean2(G_postP0,r)]=Create(G_postP0[r][1])
    
r=len(G_postP0)-2
DpostP0[clean2(G_postP0,r)+' R']=Create(G_postP0[r][2][0])
DpostP0[clean2(G_postP0,r)+' G']=Create(G_postP0[r][2][1])
DpostP0[clean2(G_postP0,r)+' B']=Create(G_postP0[r][2][2])

#--------------------------------------------------------
#  MEGAPOV 0.7 only : posterize
#--------------------------------------------------------
DpostP1={}
DpostP1[clean2(G_postP1,1)+' R']=Create(G_postP1[1][2][0])
DpostP1[clean2(G_postP1,1)+' G']=Create(G_postP1[1][2][1])
DpostP1[clean2(G_postP1,1)+' B']=Create(G_postP1[1][2][2])


#--------------------------------------------------------
#  MEGAPOV 0.7 only : Focal Blur
#--------------------------------------------------------
DpostP2={}
for r in range(1,len(G_postP2)-1):
      DpostP2[clean2(G_postP2,r)]=Create(G_postP2[r][1])


#print LPostprocess
#print prf.povanimlist
#--------------------------------------------------------
#  Rendering Image Sizes buttons
#--------------------------------------------------------
NxSize=Create(nxsize)
NySize=Create(nysize)
SizeMenu=Create(sizemenu)

TBlenderSize=Create(tBlenderSize)

#OverSize=Create(0)


#--------------------------------------------------------
#  Layers buttons
#--------------------------------------------------------
TFullLayer=Create(FullLayer)
TCurrentLayer=Create(tCurrentLayer)

CURRENTLAYER=Blender.Window.ViewLayer()  #30/10/2004
taglayer=900
Blay={}
for bl in range(0+taglayer,20+taglayer,1):
  #Blay[bl]=Create(layer[bl-taglayer])
  Blay[bl]=Blender.Draw.Create(0)
  if tCurrentLayer and bl-taglayer+1 in CURRENTLAYER:
     Blay[bl].val=1
     layer[bl-taglayer]=Blay[bl].val


#--------------------------------------------------------
#  textures buttons (main window)
#--------------------------------------------------------
Btexturestype={}
for tt in range(3):
     Btexturestype[tt]=Create(texturestype[tt])


#--------------------------------------------------------
#  Megapov etc. Render Buttons
#--------------------------------------------------------
Tmegapov07=Create(megapov07)


#patchtype=menuPovray-1
if renderPath[0]!='': patchtype=0
elif 	renderPath[1]!='': patchtype=1

MenuMegapov=Create(menuMegapov)
if OLDPROFIL : MenuPovray=Create(menuPovray)
else : MenuPovray=Create(patchtype+1)

Bmegapovrend=Create(0)
print Bmegapovrend
Tcontinu_povrend=Create(0)
print 'patchtype',patchtype,'renderPath[patchtype]',renderPath[patchtype]
renderPath[patchtype]=renderPath[patchtype].replace('\\\\','\\')
Tmegapovpath=Create('')
Tmegapovpath.val=renderPath[patchtype]
print Tmegapovpath
pathObject=xptrueA_.globalpath(patchtype)
pathObject.currentrenderpath=Tmegapovpath.val

#--------------------------------------------------------
#  
#--------------------------------------------------------
Tpostproc=Create(0)

Tformat=Create(format)
if debug=='':
  debug=0
else:
  debug=1

Tdebug=Create(debug)

Tinifile=Create(inifile)
TlocalInifile=Create(1)

#--------------------------------------------------------
#  Options buttons
#--------------------------------------------------------
exec xptrueA_.Options_buttons

#--------------------------------------------------------
# Alias  Options
#--------------------------------------------------------
exec xptrueA_.Alias_Options

#--------------------------------------------------------
# General Lamp definition
#--------------------------------------------------------
exec xptrueA_.General_Lamp_definition

def react_export():
     global Tmain,Tmesh,Tmaterial,Tlamp,Tcamera,Tcurframe,Texpertmode,export
     global Trecalcnorm,Tgetselected

     if Tformat.val==1:
       format='inc'
     else:
       format='inc'

     if Tdebug.val==1:
       debug='debug'
     else:
       debug=''

     inifile=1
     main=Tmain.val
     world=Tmain.val
     mesh=Tmesh.val
     material=Tmaterial.val
     lamp=Tlamp.val
     camera=Tcamera.val
     curframe=Tcurframe.val
     expertmode=Texpertmode.val

     ex=[inifile,main,world,mesh,material,lamp,camera,curframe,expertmode]
     for x in range(len(ex)):
        export[x]=ex[x]

     recalcnorm=Trecalcnorm.val
     export[-2]=recalcnorm
     export[-1]=Tgetselected.val

#--------------------------------------------------------
# exportation Tglobal
#--------------------------------------------------------

def export_file(anim, patchtype, debug, format, G_Set, layer, export, texturestype):

    global G_phot, G_rad, G_standard, Tradiosity, Tphoton, Tstandard, G_Set0
    global SGlobRefl, SGlobMapVal, SGlobPaintVal, TGlobRefl, TGlobMapVal
    global TGlobPaintVal, TlightPower,SlightPowe, G_postP0, G_postP1, G_postP2
    global DpostP0, DpostP1, DpostP2, Sfindedges, Sposterize, Sfocalblur
    global NxSize, NySize, SizeMenu, rendSizeMenu, TBlenderSize
    global TSky_sphere_povray, TSky_sphere_from_cam,  TSky_s_fc_Scale
    global TMedia_Attenuation,  TAtmospheric_media, TGlobDiffuse,  TGlobAmbient
    global TGlobBrilliance, Tfocal_blur, Talias, Vfocalpoint
    global TAAlias, TmoreAAlias, TAASampling_method, TAA_threshold
    global SAA_threshold, TJitter, SJitter_Amount, TAA_Depth, SAA_Depth
    global TQuality, SQuality, TLamp_definition, SLamp_SpreadX, SLamp_SpreadZ
    global SLamp_GridX, SLamp_GridZ, SLamp_adaptive, TLamp_jitter
    global TLamp_circular, TLamp_orient, SAmbient_light, TAmbient_light, SMax_trace_level, TMax_trace_level 
    global TWireType, TWireCyl, TWireCub, TWireBlob, SWireDiam, TWireCubbis, SWirethreshold, TCompleteMaterial
    global Tcontinu_povrend, MImgOutputType, Nbitperplane, TPvm, PVM
    global Mradiosity, Mr_name
    postproc=[]
    
    if patchtype==2:
       vp=[Sfocalblur, Sposterize,Sfindedges]
       gp=[G_postP2, G_postP1, G_postP0]
       
       for v in vp:
           if v.val==1:
             postproc.append(gp[vp.index(v)]) 

    react_export()              
    
    if TGlobRefl.val==1:
       export[9][0][0]=1.0
       export[9][0][1]=SGlobRefl.val
    else:
       export[9][0][0]=0
       export[9][0][1]=0.0
     
    if TGlobMapVal.val==1:
       export[9][1][0]=1.0
       export[9][1][1]=round(SGlobMapVal.val,3)
    else:
       export[9][1][0]=0
       export[9][1][1]=0.0
    
    if TGlobPaintVal.val==1:
       export[9][2][0]=1.0
       export[9][2][1]=round(SGlobPaintVal.val,3)
    else:
       export[9][2][0]=0
       export[9][2][1]=0.0
       
    if len(export[9])<17:
       for adx in range(20):
              export[9].append([0,0,len(export[9])])
    
    if TFadeDistance.val==1:
       export[9][3][0]=1
       if TFadePower.val==1: 
           export[9][3][1]=1
       else:
           export[9][3][1]=2
    else:
       export[9][3][0]=0
       export[9][3][1]=0.0
     
    #[0,lightPower]
     
    if TInterpol.val==1.0:
       export[9][4][0]=1
       if TInterpolType.val==1.0: 
           export[9][4][1]=4
       else:
           export[9][4][1]=2
    else:
       export[9][4][0]=0
       export[9][4][1]=0.0
      
    #[0,GlobDiffuse],
    #[0,GlobAmbient],
    #[0,GlobBrilliance]

    if TlightPower.val==1:
       export[9][5][0]=1.0
       export[9][5][1]=round(SlightPower.val,7)
    else:
       export[9][5][0]=0
       export[9][5][1]=1.0

    
    if TGlobDiffuse.val==1:
       export[9][6][0]=1.0
       export[9][6][1]=round(SGlobDiffuse.val,7)
    else:
       export[9][6][0]=0
       export[9][6][1]=0.6

    if TGlobAmbient.val==1:
       export[9][7][0]=1.0
       export[9][7][1]=round(SGlobAmbient.val,7)
    else:
       export[9][7][0]=0
       export[9][7][1]=0.1
     
    if TGlobBrilliance.val==1:
       export[9][8][0]=1.0
       export[9][8][1]=round(SGlobBrilliance.val,7)
    else:
       export[9][8][0]=0
       export[9][8][1]=1.0
       

    # TMedia_Attenuation,  TAtmospheric_media  
    if TMedia_Attenuation.val==1:
       export[9][11][0]=1
    else:
       export[9][11][0]=0
         
    if TAtmospheric_media.val==1:
       export[9][11][1]=1
    else:
       export[9][11][1]=0

    # Tfocal_blur  
    if Tfocal_blur.val==1.0 or Tdof.val==1.0:
       #print  Tfocal_blur.val,"focal blur"
       export[9][12][0]=1
       export[9][12][1]=Vfocalpoint

       if Taperture.val==1 or Tdof.val==1.0:
          export[9][13][0]=1
          export[9][13][1]=Saperture.val
       else:
          export[9][13][0]=0
          export[9][13][1]=0

       if Tblursamples.val==1:
          export[9][14][0]=1
          export[9][14][1]=Sblursamples.val
       else:
          export[9][14][0]=0
          export[9][14][1]=0
    else:
       export[9][12][0]=0
       export[9][12][1]=0
       
    # wire  type
    if TWireType.val==1.0:
      if TWireCyl.val==1:
          export[9][15]=1
      elif TWireCub.val==1:
          export[9][15]=2
      elif TWireBlob.val==1:
          export[9][15]=3
      elif TWireCubbis.val==1:
          export[9][15]=4
      export[9][16]=[SWireDiam.val,SWirethreshold.val]
    else:
          export[9][15]=1
          export[9][16]=[0.05,0.0]
          

    if TBlenderSize.val==1:
       export[9][17]=1.0
    else:
       export[9][17]=0.0

    if TAAlias.val==1:
       export[9][18][0]=TAAlias.val
       export[9][18][1]=[TAASampling_method.val,
                      [TAA_threshold.val, SAA_threshold.val],  
                      [TJitter.val,       SJitter_Amount.val],
                      [TAA_Depth.val,     SAA_Depth.val]
                         ]
       #print export
    else:
       export[9][18][0]=0
       export[9][18][1]=0
       
    if TQuality.val==1:
       export[9][19][0]=TQuality.val
       export[9][19][1]=SQuality.val
    else:
       export[9][19][0]=0
       export[9][19][1]=1

    if TLamp_definition.val==1:
       export[9][20][0]=1
       export[9][20][1]=[]
       export[9][20][1].append(SLamp_SpreadX.val)
       export[9][20][1].append(SLamp_SpreadZ.val)
       export[9][20][1].append(SLamp_GridX.val)
       export[9][20][1].append(SLamp_GridZ.val)
       export[9][20][1].append(SLamp_adaptive.val)
       export[9][20][1].append(TLamp_jitter.val)
       export[9][20][1].append(TLamp_circular.val)
       export[9][20][1].append(TLamp_orient.val)
       
    if TAmbient_light.val==1:
       export[9][21][0]=1
       export[9][21][1]=SAmbient_light.val
    else:
       export[9][21][0]=0

    if TMax_trace_level.val==1:
       export[9][22][0]=1
       export[9][22][1]=SMax_trace_level.val
    else:
       export[9][22][0]=0

    if Tcontinu_povrend.val==1:
       export[9][23][0]=1
       export[9][23][1]=Tcontinu_povrend.val
    else:
       export[9][23][0]=0
       
    #---------------------------
    # Parallele virtual Machine 
    #---------------------------
    if PVM==1 and TPvm.val:
       export[9][24][0]=1
       export[9][24][1]=TPvm.val
    else:
       export[9][24][0]=0

    #---------------------------
    # output file type
    #---------------------------
    export[9][25][0]=MImgOutputType.val
    #---------------------------
    # if pgn or ppm n bits per plane
    #---------------------------
    if  MImgOutputType.val in  [5,6,8]:
           export[9][25][1]=Nbitperplane
    else:
           export[9][25][1]=-1
    

    anim=[doAnim,
          startFrame,
          endFrame,
          TnoAnimCamera.val,
          TnoAnimMaterial.val,
          TnoAnimLamp.val]
    
    G_Set=G_Set0[:]
    
    if Tphoton.val==1:
             G_phot2=[G_phot[0]] 
             for lph in range(1,len(G_phot)-1):
                  if G_phot[lph][4]==1:
                     G_phot2.append(G_phot[lph])
             G_phot2.append(G_phot[len(G_phot)-1]) 
             G_Set[1:1]=G_phot2

    if Tradiosity.val==1:
             G_rad2=[G_rad[0]]
             for lph in range(1,len(G_rad)-1):
                  if G_rad[lph][4]==1:
                     G_rad2.append(G_rad[lph])
                     #print G_rad[lph]
                     Cr=clean(G_rad,lph)
                     if Cr=='normal':
                          G_rad2[-1][1]='on'
                          
                     if Cr=='media':
                          G_rad2[-1][1]='on'

             G_rad2.append(G_rad[len(G_rad)-1]) 
             G_Set[1:1]=G_rad2
             #print G_Set

    if global_settings==1:
        if localGT:
                   xptrueA_.Test_exportVers(patchtype,
                                            debug,
                                            format,
                                            G_Set,
                                            0,
                                            anim,
                                            layer,
                                            export,
                                            texturestype,
                                            postproc,
                                            [NxSize.val,NySize.val])
        else: 
                   xptrueA_.Test_exportVers(patchtype,
                                            debug,
                                            format,
                                            xptrueA_.GT,
                                            0,
                                            anim,
                                            layer,
                                            export,
                                            texturestype,
                                            postproc,
                                            [NxSize.val,NySize.val])
    else:
        xptrueA_.Test_exportVers(patchtype,
                                 debug,
                                 format,
                                 [['','']],
                                 0,
                                 anim,
                                 layer,
                                 export,
                                 texturestype,
                                 postproc,
                                 [NxSize.val,NySize.val]
                                )

    #print G_rad




#--------------------------------------------------------
# GUI
#--------------------------------------------------------

glCr=glRasterPos2d
glCl3=glColor3f
glCl4=glColor4f
glRct=glRectf

cf=[0.95,0.95,0.9,0.0]

def trace_rectangle4(r,c):
    glCl4(c[0],c[1],c[2],c[3])
    glRct(int(r[0]),int(r[1]),int(r[2]),int(r[3]))

def trace_rectangle3(r,c,c1):
    glCl3(c[0],c[1],c[2])
    glRct(int(r[0]),int(r[1]),int(r[2]),int(r[3]))
    glCl3(c1[0],c1[1],c1[2])
    
def winPaint():
    global cf

    #glClear(GL_COLOR_BUFFER_BIT)
    glClearColor(cf[0],cf[1],cf[2],cf[3])
    glClear(GL_COLOR_BUFFER_BIT)
    
    script=96
    
    Povwidth=script
    Povheight=16
    Povx=20
    Povy=440

    megawidth=(script+2)*3
    megaheight=16
    megax=20
    megay=Povy-24

    c=[1,1,0.6,0.2]
    c1=[.0,.0,.0,1.0]
    r=[megax-4,megay-4, megax+megawidth+2,megay+8+megaheight]
    trace_rectangle3(r,c,c1)
 
    #texte titre
    glRasterPos2d(20, Povy)
    Text("Blender to Povray 3.5 Anim Exporter, version: "+ver)
    
    r=[20,20,240,10]
    trace_rectangle3(r,c,c1)
 
    r=[28,megay,72,10]
    trace_rectangle3(r,c,c1)

#--------------------------------------------------------
#  Bas de Page pour Draw
#--------------------------------------------------------
def basdepagedraw(l1,l1b,l3,l3b,nW):
      global Tmegapovpath,Tprofils, Tcontinu_povrend, TPvm

      r=[
         [20     , 7, 90, 18],
         [150    , 7, 78, 22],
         [230    , 7, 80, 18],
         [113    , 7, 34, 18],

         [20      , 10+20, 70, 20],
         [20+74   , 10+24, 70, 16],
         [20+74*2 , 10+24, 70, 16],
         [20+74*3 , 10+20, 70, 20]
      ]
      
      layery=152 
      expx=20
      expwidth=88 #412
      expheight=18

      c=[0.8,0.25,0.1,0.2]
      c1=[.1,.0,.0,1.0]

      if  Tprofils.val==0.0:
              r2=[expx-4, layery-70, int(expx+expwidth*2.6)+4, layery-98]
              #trace_rectangle3(r2,c,c1)

              c1=[1.0,0.95,0.95,1.0]
              glCl3(c1[0],c1[1],c1[2])              
              #texte commentaire
              glRasterPos2d(expx+1, layery-72+1)
              Text("Spawn Renderer:")
              c1=[.1,.0,.0,1.0]
              glCl3(c1[0],c1[1],c1[2])              
              #texte commentaire
              glRasterPos2d(expx, layery-72)
              Text("Spawn Renderer:")
              
              tooltips="Path to the pov render:"+Tmegapovpath.val
              
              Tmegapovpath=String("Path:", 715, #PATHBUTTON
                                   expx+int(expwidth*0.82)+16, 
                                       layery-92, int(expwidth*1.8)-16, 
                                       expheight,Tmegapovpath.val,380,tooltips)
              
              if PVM==1:
                    Bmegapovrend=Button("Render", RENDERBUTTON, expx, 
                                       layery-92, int(expwidth*0.6), 
                                       expheight,"Render the current exported file (if a ini file exists).")
                    TPvm=Toggle('P', 717, #PVMBUTTON
                                       int(expx+expwidth*0.62), 
                                       layery-92, 16, 
                                       expheight,
                                       TPvm.val, 'To activate PVM' )
              else:     
                    Bmegapovrend=Button("Render", RENDERBUTTON, expx, 
                                       layery-92, int(expwidth*0.8), 
                                       expheight,"Render the current exported file (if a ini file exists).")
                    
              Tcontinu_povrend=Toggle('C', 716, #CONTINUEBUTTON
                                       int(expx+expwidth*0.82), 
                                       layery-92, 16, 
                                       expheight,
                                       Tcontinu_povrend.val, 'To Continue to render the last exported file.' )
              
              Tprofils=Toggle('profiles', PROFILESBUTTON, expx+int(expwidth*(0.82+1.8))+8, 
                                       layery-96, int(expwidth*0.7)-8, 
                                       int(expheight*1.8), Tprofils.val, 'Profils mode to save or load GUI profils.' )
              
      else:
              BprofilsSave=Button("Save Profile", 611, #SAVEPROFILEBUTTON
                                       expx, 
                                       layery-92, int(expwidth*1.3), 
                                       int(expheight*1.4),"Save current profile as the standard profil. Will be reloaded when the script is started")
              
              BprofilsSave=Button("Restore Profile", RESPROFILESBUTTON, expx+int(expwidth*1.3)+2, 
                                       layery-92, int(expwidth*1.3), 
                                       int(expheight*1.4),"Try to Restore the last saved profile.")
              
              Tprofils=Toggle('profiles', PROFILESBUTTON, expx+int(expwidth*(0.82+1.8))+8, 
                                       layery-96, int(expwidth*0.7)-8, 
                                       int(expheight*1.8), Tprofils.val, 'Profile mode to save or load GUI profils.' )
          
      
      c=[1.0,0.65,0.3,0.2]
      c1=[.1,.0,.0,1.0]

      r0=[
            r[nW][0]-5,
            r[nW][1]-5,
            r[nW][2]+r[nW][0]+5,
            r[nW][3]+r[nW][1]+5
         ]
      
      trace_rectangle3(r0,c,c1)
      
      Button("Main", 96, r[4][0], r[4][1],r[4][2],r[4][3])
      Button("Radiosity", 97, r[5][0], r[5][1],r[5][2],r[5][3])
      Button("Photons", 98, r[6][0], r[6][1],r[6][2],r[6][3])
      Button("Material", 99, r[7][0], r[7][1],r[7][2],r[7][3])
      
      Button(l1, 21, r[0][0], r[0][1],r[0][2],r[0][3],l1b)
      Button("Export to file", 22, r[1][0], r[1][1],r[1][2],
             r[1][3],'For the moment, you have to use by yourself povray and the ini file to render')
      Button(l3, 37, r[2][0], r[2][1],r[2][2],r[2][3],l3b)
      Button("Exit", 1, r[3][0], r[3][1],r[3][2],r[3][3])

#--------------------------------------------------------
#  Bas de Page pour Bevent
#--------------------------------------------------------
def BasdepageBevent(evt,a,b):
        global xptrueA_ , Tmegapovpath, Tprofils , Tmegapov07
        global patchtype, pathObject,prf, ls, layer
        
        if   (evt==21): windows(a)
        elif (evt==37): windows(b)

        elif (evt==99): windows(MATERIALSGUI)
        elif (evt==98): windows(PHOTONSGUI)
        elif (evt==97): windows(RADIOSITYGUI)
        elif (evt==96): windows(MAINGUI)

        elif (evt==1): 
                    xptrueA_;
                    try: 
                       sys.path=oldsys[:]
                       del sys
                       Exit()
                    except:
                       import sys 
                       sys.path=oldsys[:]
                       del sys
                       Exit()
                       
        elif (evt==22):
           export_file(anim, patchtype, debug, 'inc',  G_Set, layer, export, texturestype)
           
        elif (evt==713):
            if Tmegapov07.val==1:
                patchtype=MenuPovray.val-1
            else:
                patchtype=MenuMegapov.val+1
            print 'patch ',MenuPovray.val, patchtype
            #
            #
            Tmegapovpath.val=renderPath[patchtype]
            pathObject.currentrenderpath=Tmegapovpath.val
            #
            #
            pathObject.modif_render(patchtype)
            
        elif (evt==RENDERBUTTON):
          #
          pathObject.modif_render(patchtype)
          pathObject.currentrenderpath=Tmegapovpath.val
          #
          test=pathObject.test()

          print 'test', test,  'currentrenderpath', pathObject.currentrenderpath

          if test==3 :             
              cmd = Tmegapovpath.val+pathObject.sep+renderName[patchtype]
              args =('"'+cmd+'"'," /RENDER ",'\"'+pathObject.inifile+'\"')

              print cmd+" /RENDER "+'\"'+pathObject.inifile+'\"'

              if pathObject.name=='nt':
                    pathObject.osl.spawnv(pathObject.osl.P_NOWAIT, cmd, args)
              elif pathObject.name=='posix':
                    pathObject.osl.system(cmd+" "+pathObject.inifile+" &")
                    
          elif test==0:            
            print "file "+pathObject.inifile+" can not be found."

            pathObject.inifile=Blender.Draw.PupStrInput("Inifile not found at :",pathObject.inifile, 100)
            pathObject.currentrenderpath=Blender.Draw.PupStrInput("False render path :",pathObject.currentrenderpath, 250)

          elif test==1:            
            print 'pathObject.currentrenderpath',pathObject.currentrenderpath
            pathObject.currentrenderpath=Blender.Draw.PupStrInput("False render path :",pathObject.currentrenderpath, 100)

          elif test==2:
            print pathObject.inifile    
            pathObject.inifile=Blender.Draw.PupStrInput("Inifile not found at :",pathObject.inifile, 100)
            
        elif (evt==PROFILESBUTTON):
            Blender.Draw.Redraw(1)

        elif (evt==611):
            print prf.path
            exec "prf.prf_save(1,%s)"%prf.functions_List
            
        elif (evt==RESPROFILESBUTTON):
            prf.prf_load()
            for prf_n in prf.povanimlist:
                 exec '%s=prf.%s'%(prf_n,prf_n)
            Tgphotons_state('restaure')
            Tgradiosity_state('restaure')
            exec "prf.prf_save(0,%s)"%prf.functions_List            
            Blender.Draw.Redraw(1)

#--------------------------------------------------------
#  Main Windows
#--------------------------------------------------------
 
def DR_Main():
    global Blay, taglayer,FullLayer, TFullLayer, CurrentLayer,TCurrentLayer
    global Tpovray35, Tmegapov07,layer,patchtype,TnoAnimCamera
    global TnoAnimMaterial,TnoAnimLamp, cf, MenuMegapov, MenuPovray, MegapovMenu, PovrayMenu, Bmegapovrend,Tcontinu_povrend, Tmegapovpath, pathObject
    global SstartFrame, SendFrame,noAnimCamera,noAnimMaterial,noAnimLamp,startFrame, endFrame
    global Tglobal_settings, TlocalGT,localGT,global_settings,anim,TdoAnim,doAnim,Tpostproc
    global format, debug, inifile, main, world, mesh, material,lamp,camera,curframe, export,expertmode, recalcnorm
    global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp,Tcamera,Tcurframe
    global Texport,TExpAll,Texpertmode,Trecalcnorm, Tgetselected
    global NxSize, NySize, SizeMenu, rendSizeMenu, Tprofils, Tfocal_blur, Talias, TBlenderSize

    script=96
    Povwidth=script
    Povheight=16
    Povx=20
    Povy=440

    megawidth=(script+2)*3
    megaheight=16
    megax=20
    megay=Povy-24
 
   # 
    c=[0.95,0.95,0.8,0.2]
    c1=[.1,.0,.0,1.0]
    
    r=[megax+8,megay-4*megaheight+2, megax+megawidth*3+6,megay+2*megaheight]
    trace_rectangle3(r,c,c1)

    winPaint()
    
    #texte commentaire
    glRasterPos2d(megax+script+4, megay+2)
    #Text("Compatibility to patch")

    if Tmegapov07.val==0:
        Tmegapov07=Toggle('Povray Patch compatibility (mega,ml,sub)', MEGAPOV,
                          megax, megay, 2*megawidth/3, megaheight, Tmegapov07.val,' To export with megapov compatibility.' )
        MenuPovray=Menu(PovrayMenu,POVRAYMENU, 
                        megax+megawidth*2/3, megay, megawidth/3, megaheight, MenuPovray.val,' Select the povray patch type.' )
    else:
        MenuMegapov=Menu(MegapovMenu, MEGAPOVMENU, 
                         megax+megawidth*2/3, megay, megawidth/3, megaheight, MenuMegapov.val,' Select the povray patch type.' )
        
        if MenuMegapov.val==1:
            Tmegapov07=Toggle('MegaPov0.7 compatibility', MEGAPOV, 
                              megax, megay, int(megawidth*0.333), megaheight, Tmegapov07.val,"To unselect Megapov Export" )
            Button('PostProcess', POSTPROCESSBUTTON, #POSTPROCESSBUTTON
                   int(megax+megawidth*0.333), megay, int(megawidth*0.333), megaheight," Only available for Megapov0.7 Export" )
        elif MenuMegapov.val<4:
            Tmegapov07=Toggle('MegaPov compatibility on', MEGAPOV,
                              megax, megay, int(megawidth*0.666), megaheight, Tmegapov07.val,"To unselect Megapov Export"  )
        elif MenuMegapov.val==4:
            Tmegapov07=Toggle('Povray mesh2 subsurf test on', MEGAPOV,
                              megax, megay, int(megawidth*0.666), megaheight, Tmegapov07.val,"To unselect subsurftest Export"  )

        elif MenuMegapov.val==5:
            Tmegapov07=Toggle('Megapov mechsim test on', MEGAPOV,
                              megax, megay, int(megawidth*0.666), megaheight, Tmegapov07.val,"To unselect mechsim export"  )
            
        #Button("Radio Win"  , 37, 220                 , 10   , 90            , 19        ,'Windows to define new properties to materials and textures.')


    

    animwidth=script
    animheight=16
    animx=20
    animy=megay-40
    

    r=[animx-3,animy-4*animheight+2, animx+animwidth*3+6,animy+2*animheight-8]
    trace_rectangle3(r,c,c1)
    
    #texte commentaire
    glRasterPos2d(animx, animy+20)
    Text("Animation options: ")
    
    TnoAnimCamera=Toggle('noAnimCamera', ANIMCAMERABUTTON, #ANIMCAMERABUTTON=27
                         animx, animy, animwidth, animheight, TnoAnimCamera.val )
    TnoAnimMaterial=Toggle('noAnimMaterial', ANIMMATERIALBUTTON, #ANIMMATERIALBUTTON=28
                           animx+script+2, animy, animwidth, animheight, TnoAnimMaterial.val )
    TnoAnimLamp=Toggle('noAnimLamp', ANIMLAMPBUTTON, # ANIMLAMPBUTTON=29
                       animx+2*(script+2), animy, animwidth, animheight, TnoAnimLamp.val )
    TdoAnim=Toggle('doAnim', DOANIMBUTTON, # DOANIMBUTTON=30
                   animx, animy-19, animwidth+(script+2), animheight, TdoAnim.val )

    SstartFrame=Slider('startFrame', STARTFRAMEBUTTON , # STARTFRAMEBUTTON=31
                       animx, animy-19*2, animwidth+(script+2), animheight, SstartFrame.val, 0, 1000, 0, ' If startAnim=0 then Blender startAnim value is used instead.' )
    SendFrame=Slider('endFrame', ENDFRAMEBUTTON , # ENDFRAMEBUTTON=32
                     animx, animy-19*3, animwidth+(script+2), animheight, SendFrame.val, 1, 1000,0,'')

    settwidth=script-2
    settheight=16
    settx=20
    setty=animy-100
    
    r=[settx-3,setty-3, settx+settwidth*2+6,setty+2*settheight-8]
    trace_rectangle3(r,c,c1)
    
    #texte commentaire
    glRasterPos2d(settx, setty+20)
    Text("Global settings: ")

    Tglobal_settings=Toggle('Global Settings', 33, settx, setty, settwidth, settheight, Tglobal_settings.val,'Add inner Standard Settings for radiosity, photons, etc.' )
    if Tglobal_settings.val==0:
       TlocalGT=Toggle('local GT', 34, settx+script+2, setty, settwidth, settheight, 0,'If Global Settings are set, you can define your own Settings in Lights Control window.' )
    else:
       TlocalGT=Toggle('local GT', 34, settx+script+2, setty, settwidth, settheight, TlocalGT.val,'If Global Settings are set, you can define your own Settings in Lights Control window.' )

    setty=animy-76
    settwidth=script-16 
    settx=20+16

    r=[settx+script*2-10, setty-settheight*4,settx+script*2+8+settwidth,setty+4*settheight+8]
    trace_rectangle3(r,cf,c1)

    r=[settx+script*2-2, setty-settheight-4,settx+script*2+6+settwidth,setty+2*settheight+24]
    trace_rectangle3(r,c,c1)
  
    #texte commentaire
    glRasterPos2d(settx+script*2+8, setty+52)
    Text("Textures")
    glRasterPos2d(settx+script*2+8, setty+36)
    Text("Formats")
    
    if Btexturestype[0].val==0:
           Ttexturestype[0]='Longer'
    else:
           Ttexturestype[0]='Shorter'

    if Btexturestype[1].val==0:
           Ttexturestype[1]='Pigment_map'
    else:
           Ttexturestype[1]='Texture_map'

    Btexturestype[0]=Toggle(Ttexturestype[0], 39, #TEXTURETYPE_LONG 
                        settx+script*2+2+int(0*settwidth/3), setty+16, 
                        settwidth, settheight-1, Btexturestype[0].val,
                        'Special Export textures format: really shorter and optimised list, or faster export but heavy file')

    Btexturestype[1]=Toggle(Ttexturestype[1], 40, #TEXTURETYPE_MAP
                        settx+script*2+2+int(0*settwidth/3), setty, 
                        settwidth, settheight-1,Btexturestype[1].val,
                        'Special Export textures format: Pigment_map or texture_map (done!)')

    Btexturestype[2]=Toggle(Ttexturestype[2], 41, #TEXTURETYPE_LIST
                        settx+script*2+2+int(0*settwidth/3), setty-16, 
                        settwidth, settheight-1, 0,
                        'Special Export textures format: separate textures files or text_list (to do)')

    setty=animy-100

    expwidth=script
    expheight=16
    expx=20
    expy=setty-35
    
    r=[expx-4,expy-10-expheight*5,expx+expwidth*3+6,expy+expheight+8]
    trace_rectangle3(r,c,c1)
    
    expwidth=script-8
    script=expwidth

    #texte commentaire
    glRasterPos2d(expx, expy+20)
    Text("Exports: ")

    # Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp,Tcamera
   
    Tcurframe=Toggle('Current frame', 36, expx, expy, expwidth, expheight, Tcurframe.val,'Restaure Current frame after the exportation.' )
    Tmain=Toggle('Main', 36, expx+script, expy, expwidth, expheight, Tmain.val,'Export the Main file' )
    Tcamera=Toggle('Camera', 36, expx+script*2, expy, expwidth, expheight, Tcamera.val,'Export Camera' )

    # --- correction du 04/06
    if Tgetselected.val==1:
       Tmesh.val=1
    # --- correction du 04/06 /fin >
 
    Tmesh=Toggle('Meshes', 36, #EXPORTPARAMETERS
                 expx, expy-expheight, expwidth, expheight, Tmesh.val,'Export Meshes with textures, Script suppose that Materials are yet exported.' )
    if Tgetselected.val==1:
       Tmaterial.val=0

    Tmaterial=Toggle('Materials', 36,
                     expx+script, expy-expheight, expwidth, expheight, Tmaterial.val,'Export Materials' )
    Tlamp=Toggle('Lamps', 36,
                 expx+script*2, expy-expheight, expwidth, expheight, Tlamp.val,'Export Lamp' )
        
    Tformat=Toggle('Format: "inc"', 36,
                   expx, expy-expheight*2, expwidth, expheight, 1 ,'Choose between "inc": better!! no "txt" for the moment, have to be debugged' )
    Tdebug=Toggle('Debug', 36,
                  expx+script, expy-expheight*2, expwidth, expheight, Tdebug.val,'Print lot of infos about exported data' )
    Texpertmode=Toggle('Expert', 36,
                  expx+script*2, expy-expheight*2, expwidth, expheight, Texpertmode.val, 'Expert Mode: doesn\'t stop export on error except for camera.' )

    TExpAll=Toggle('All', 38,
                   int(expx+script*1.5+expwidth*1.5), expy-expheight*3, int(expwidth/3), expheight*4, TExpAll.val,'Export All files' )
    
    Trecalcnorm=Toggle('Calc. Norm.', 36,
                       expx, expy-expheight*3, expwidth, expheight, Trecalcnorm.val, 'Calculate normals for all smoothed faces.' )
    Tgetselected=Toggle('Add selected 2 Export', 36,
                       expx+expwidth, expy-expheight*3, expwidth*2, expheight, Tgetselected.val, 'Export selected object[s] and join them to the current <<yet>> exported file.' )
    
    
    script=expwidth+8

    Lwidth=22
    Lheight=16
    layerx=20
    layery=setty-88-expheight
    

    for y in range(2):
      for x in range(10):        
        Blay[y*10+x+taglayer]=Toggle('%s' % (y*10+x+1), y*10+x+taglayer, layerx+x*Lwidth, layery-y*(Lheight), Lwidth, Lheight, Blay[y*10+x+taglayer].val,'Layer')

    TFullLayer=Toggle('All Layers', 35, Lwidth*11, layery, Lwidth*3+2, Lheight, TFullLayer.val,'Set all Layers on/off.')
    TCurrentLayer =Toggle('Cur Layers', 48, Lwidth*11, layery-Lheight, Lwidth*3+2, Lheight, TCurrentLayer.val,'Set Povanim\'s exported layers to Blender current active layers .')

    r=[expx-4, layery-56, expx+expwidth*3.3+4, layery-28]
    trace_rectangle3(r,c,c1)
    
    #texte commentaire
    glRasterPos2d(expx, layery-32)
    Text("Image Size: ")
    if TBlenderSize.val==1.0:
      titre='BSizes off'
      TBlenderSize=Toggle(titre,518 , #DEFAULTSIZE
                                expx, layery-52, 
                                int(expwidth*0.5), expheight, 
                                TBlenderSize.val,
                                'Jump to others choise for size of render.'
                         )
      
      NxSize=Number('xSize ', 510, #RENDERXSIZE
                                     int(expx+expwidth*0.62), layery-52, 
                                     int(expwidth*0.85), expheight, 
                                     NxSize.val,
                                     0,4096,'Render image size X, Blender 2.25.' )
      NySize=Number('ySize ', 511, #RENDERYSIZE
                                     int(expx+expwidth*1.47), 
                                     layery-52, int(expwidth*0.85) ,
                                     expheight, NySize.val,
                                     0,4096,
                                       'Render image size Y, Blender 2.25.' )
      SizeMenu=Menu(rendSizeMenu, 512, int(expx+expwidth*2.4), #RENDERSIZEMENU
                                     layery-52, int(expwidth*0.9), 
                                     expheight, SizeMenu.val,
                                     'Render image size XY Menu.' )
    else:
      titre='Default : use blender size. Others Sizes off'
      TBlenderSize=Toggle(titre,518 ,  #DEFAULTSIZE
                                expx, layery-52, 
                                int(expwidth*3.3), expheight, 
                                TBlenderSize.val,
                                'Jump to others choise for size of render.'
                         )

    # --- ajout du 10/06
    r=[expx-4, layery-82, expx+expwidth*2.2+4, layery-58]
    c=[0.85,0.85,0.2,0.2]
    c1=[.1,.0,.0,1.0]
    trace_rectangle3(r,c,c1)

    c=[0.75,0.55,0.1,0.2]
    c1=[.1,.0,.0,1.0]

    Button('Focal Blur/Anti-Alias ', 514, #FOCALBLUR
                                   expx, 
                                   layery-78, int(expwidth*1.65), 
                                   expheight, 
                                     'Focal Blur' )
    Button('Area Light Value ', 515, #AREALIGHT
                                   int(expx+expwidth*1.7), 
                                   layery-78, int(expwidth*1.65), 
                                   expheight, 
                                     'Anti-alias' )
    # --- ajout du 10/06 fin >
    l1='Paths Set';l1b='Paths Settings'
    l3='Light win 1';l3b='Firt Light windows : radiosity parameters'

    basdepagedraw(l1,l1b,l3,l3b,4)

def event(evt, val):	
      if (evt==QKEY and not val): Exit()

def BE_Main(evt):

      global Blay,taglayer, FullLayer, TFullLayer, CurrentLayer,TCurrentLayer
      global Tpovray35, Tmegapov07,layer, patchtype,TnoAnimCamera
      global TnoAnimMaterial,TnoAnimLamp,Tpostproc
      global MenuMegapov, MegapovMenu, MenuPovray, PovrayMenu, Bmegapovrend,Tcontinu_povrend, Tmegapovpath, pathObject, renderPath, renderName
      global SstartFrame, SendFrame,noAnimCamera,noAnimMaterial,noAnimLamp,startFrame, endFrame
      global Tglobal_settings, TlocalGT,localGT,global_settings,anim,TdoAnim,doAnim
      global format, debug, inifile, main, world, mesh, material,lamp,camera 
      global export,expertmode,recalcnorm
      global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp, Tcamera
      global Texport,Texpertmode,Trecalcnorm, Tgetselected
      global texturestype, Ttexturestype, TGlobRefl, TGlobMapVal, TGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
      global NxSize, NySize, SizeMenu,rendSizeMenu, Tprofils, TBlenderSize
      global Tfocal_blur, Talias, Vfocalpoint, Saperture, Svariance, Sconfidence

      BasdepageBevent(evt,7,2)

      if (evt in Blay.keys()):
            for B in Blay.keys():
             layer[B-taglayer]= Blay[B].val

      elif (evt==POSTPROCESSBUTTON): windows(POSTPROCESSGUI)

      elif (evt==MEGAPOV) or (evt==MEGAPOVMENU):
            if Tmegapov07.val!=0 :
                patchtype=MenuMegapov.val+1
                Tmegapovpath.val=renderPath[patchtype]
            else:
                patchtype=MenuPovray.val-1
                Tmegapovpath.val=renderPath[patchtype-1]

            print  'patchtype : ',patchtype, 'evt=',evt 
            pathObject.modif_render(patchtype)

      elif (evt==POVRAYMENU):
            if Tmegapov07.val==0 :
                  patchtype=MenuPovray.val-1 
                  Tmegapovpath.val=renderPath[patchtype]
            else:
                patchtype=MenuMegapov.val+1
                Tmegapovpath.val=renderPath[patchtype+1]
            print  'patchtype : ',patchtype, 'evt=',evt 

            #patchtype=MenuPovray.val

            Tmegapovpath.val=renderPath[patchtype]
            pathObject.modif_render(patchtype)
            
            
      elif (evt==ANIMCAMERABUTTON):
           noAnimCamera=TnoAnimCamera.val
      elif (evt==ANIMMATERIALBUTTON):
           noAnimMateriel=TnoAnimMaterial.val
      elif (evt==ANIMLAMPBUTTON):
            noAnimLamp=TnoAnimLamp.val
      elif (evt==DOANIMBUTTON):
           doAnim=TdoAnim.val
      elif (evt==STARTFRAMEBUTTON):
           startFrame=SstartFrame.val
      elif (evt==32):
           endFrame=SendFrame.val
      elif (evt==33):
         global_settings=Tglobal_settings.val
      elif (evt==34):
         if  Tglobal_settings.val==0:
             TlocalGT.val==0
             Blender.Draw.Redraw(1)
         else:
            localGT=TlocalGT.val
         

      elif (evt==35):
         for B in Blay.keys():
             Blay[B].val=TFullLayer.val
             layer[B-taglayer]= Blay[B].val

      elif (evt==48):
       if TCurrentLayer.val:
         CURRENTLAYER=Blender.Window.ViewLayer()  #12/02/2006
         for bl in Blay.keys():
            if bl-taglayer+1 in CURRENTLAYER:
              Blay[bl].val=1
              layer[bl-taglayer]=Blay[bl].val
             
   
      elif (evt==36):
           react_export()              
 
      elif (evt==38):
              Tmain.val=TExpAll.val

              Tmesh.val=TExpAll.val
              Tmaterial.val=TExpAll.val
              Tlamp.val=TExpAll.val
              Tcamera.val=TExpAll.val
              Tcurframe.val=TExpAll.val
              Tdebug.val=TExpAll.val
              Texpertmode.val=TExpAll.val
               
              ex=[Tinifile.val,Tmain.val,world,Tmesh.val,Tmaterial.val,Tlamp.val,Tcamera.val,Tcurframe.val,Texpertmode.val]
              for x in range(len(ex)):
                 export[x]=ex[x]

              # correction du 05/24
              #Trecalcnorm.val=TExpAll.val
              # correction du 05/24 /fin >

              export[-2]=Trecalcnorm.val
              
              # correction du 05/23
              #Tgetselected.val=TExpAll.val
              # correction du 05/24 /fin >

              export[-1]=Tgetselected.val
               
      elif (evt==39):
           texturestype[0]=Btexturestype[0].val
      elif (evt==40):
           texturestype[1]=Btexturestype[1].val

      elif (evt==510):
          NxSize.val=NxSize.val

      elif (evt==511):
          NySize.val=NySize.val
              
      elif (evt==512):
          if SizeMenu.val==1:
              NxSize.val=160
              NySize.val=120
          if SizeMenu.val==2:
              NxSize.val=320
              NySize.val=240
          elif SizeMenu.val==3:
              NxSize.val=480
              NySize.val=360
          elif SizeMenu.val==4:
              NxSize.val=640
              NySize.val=480
              
          elif SizeMenu.val==5:
              NxSize.val=720
              NySize.val=512
          elif SizeMenu.val==6:
              NxSize.val=800
              NySize.val=600

      elif (evt==518):
            pass

      elif (evt==515):
            windows(OTHERSSTTINGSGUI)
            
      elif (evt==514):        
            windows(RENDERGUI)
          
        
      Blender.Draw.Redraw(1)

#--------------------------------------------------------
#  second Windows 
#--------------------------------------------------------
   
def DR_Radiosity():
    global Tradiosity, Dradiosity,Tgradiosity,Tnumb, TlocalGTm, TGlobRefl
    global TAmbient_light,SAmbient_light
    global TGlobMapVal, TGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal 
    global format, debug, inifile, main, world, mesh, material,lamp,camera, export,expertmode
    global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp,Tcamera, Texport,Texpertmode
    global Mradiosity, Mr_name, D_defrad
    
    TRnumb=Tnumb+50

    winPaint()
    #texte titre
    glRasterPos2d(20, 422);Text("Light Controls (1):")
    
    script=96;Povy=440
    megawidth=(script+2)*3;megaheight=16;megax=20;megay=Povy-24;animwidth=script; animheight=16
    animx=40
    animy=megay

    c=[0.85,0.85,0.1,0.2]
    c1=[.1,.0,.0,1.0]

    r=[megax+script-8,megay-15*megaheight, megax+animwidth*3, megay-20]
    trace_rectangle3(r,c,c1)
  
    if Tradiosity.val==1:
        if TlocalGT.val==1:
            Tradiosity =Toggle('Rad on', 670, animx+script+8, animy, int((animwidth+script)*0.3), animheight, Tradiosity.val,)
            Mradiosity =Menu(Mr_name, 618, animx+script+28+42,
                             animy, int(animwidth+script*0.52),
                             animheight, Mradiosity.val, "Radiosity settings  menu.")
        else:
            Tradiosity =Toggle('Rad on', 670, animx+script+8, animy, int((animwidth+script)*0.3), animheight, Tradiosity.val,"Not exported, <<Local Global Setting Tags>> not set in Main window")
            Mradiosity =Menu(Mr_name, 618, animx+script+28+42,
                             animy, int((animwidth+script)*0.52),
                             animheight, Mradiosity.val, "Radiosity settings menu .")
    else:
      Tradiosity =Toggle('Radiosity off', 670, animx+script+8, animy, int(animwidth+script*0.7), animheight, Tradiosity.val,)
    
    animy=megay-24
     
    if Tradiosity.val==1:
       for r in range(1,len(G_rad)-1):
             Cr=clean(G_rad,r)
             if Cr!='media' and Cr!='normal':   
                if Tgradiosity[Cr].val==1:
                     Dradiosity[Cr]=Slider( Cr+' ',Tnumb+G_rad[r][5], animx-20, 
                                         animy-19*(r-1), int(animwidth+(script*1.65+2)),
                                         animheight, Dradiosity[Cr].val, 
                                         G_rad[r][2],G_rad[r][3],0,'Activate parameter: choose the value.' )

                     Tgradiosity[Cr]=Toggle("A", Tnumb+G_rad[r][5],
                                 int(animx+animwidth+(script*1.65+2)-20), animy-19*(r-1),animwidth/4 ,
                                 animheight, Tgradiosity[Cr].val,'Toggle to desactivate this parameter')
                      
                     Button("R", TRnumb+G_rad[r][5] ,
                                 int(animx+animwidth+(script*1.65+2)), animy-19*(r-1), animwidth/4,
                                 animheight ,'Reset')
                     

                else:
                   Tgradiosity[Cr]=Toggle(Cr+' %s' % round(Dradiosity[Cr].val,3), 
                                  Tnumb+G_rad[r][5],
                                 animx+24, animy-19*(r-1), animwidth+(script+2),
                                 animheight, Tgradiosity[Cr].val,'Toggle to activate this parameter')

                   Button("R", TRnumb+G_rad[r][5] ,animx+24+animwidth+(script+2), 
                               animy-19*(r-1), int(animwidth/4), animheight ,'Reset')
     
             else:
                  Dradiosity[Cr]= Toggle(Cr, 
                                         Tnumb+G_rad[r][5],  
                                         int(animx+(r-1)*script*1.7),
                                         animy-19, 
                                         animwidth, 
                                         animheight,
                                         Dradiosity[Cr].val)
    
    else:
       for r in range(1,len(G_rad)-1):
             Cr=clean(G_rad,r)
             if Cr!='media' and Cr!='normal':   
                
                  Tgradiosity[Cr]=Toggle(Cr+' %s' % round(Dradiosity[Cr].val,3), 
                                  Tnumb+G_rad[r][5],
                                 animx+24, animy-19*(r-1), animwidth+(script+2),
                                 animheight, Tgradiosity[Cr].val,'Toggle to activate this parameter')
                  Button("R", TRnumb+G_rad[r][5] ,animx+24+animwidth+(script+2), animy-19*(r-1), animwidth/4,
                                 animheight ,'Reset')
             else:
                  Dval=0
                  if Dradiosity[Cr].val=='on':
                     Dval=1
                  elif Dradiosity[Cr].val=='off':
                     Dval=0
                  Dradiosity[Cr]= Toggle(Cr, 
                                         Tnumb+G_rad[r][5],  
                                         int(animx+(r-1)*script*1.7),
                                         animy-19, 
                                         animwidth, 
                                         animheight,
                                         Dval)
                  
    if TAmbient_light.val==1:
       TAmbient_light=Toggle("GS : Ambient Light ",623, 
                                 animx+24, animy-19*15, int(animwidth*.5),
                                 animheight, TAmbient_light.val,'Global setting : Ambient Light')
       SAmbient_light=Slider("Ambient Light ",624, 
                                 animx+24+int(animwidth*.5), animy-19*15, animwidth*2,
                                 animheight, SAmbient_light.val,0.0,4.0,0,'Global setting : Ambient Light')
    else:
       TAmbient_light=Toggle("Ambient Light ",623, 
                                 animx+24, animy-19*15, int(animwidth*2.5),
                                 animheight, TAmbient_light.val,'Global setting : Ambient Light')

    l1="Main Win";l1b='Windows to define new properties to materials and textures.'
    l3="Light win2";l3b='photons control and extral global light parameters.'
    basdepagedraw(l1,l1b,l3,l3b,5)


def BE_Radiosity(evt):
      global Tradiosity, Tphoton, Tnumb,TlocalGT, TGlobRefl, TGlobMapVal, TGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
      global G_Set, G_Set0, G_rad, G_phot, SAmbient_light, TAmbient_light
      global format, debug, inifile, main, world, mesh, material,lamp,camera, export,expertmode
      global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp,Tcamera, Texport,Texpertmode
      global Mradiosity, Mr_name, D_defrad
      
      TRnumb=Tnumb+50
      Tnummax=len(G_rad)-1

      BasdepageBevent(evt,1,3)
      if (evt==670):
         if Tradiosity.val==1:
            for r in range(3,len(G_rad)-1):
               Cr=clean(G_rad,r)
               if Cr!='media' or Cr!='normal':
                  Dradiosity[Cr].val=D_defrad[Cr][int(Mradiosity.val-1)]
                  Tgradiosity[Cr].val=1
                  G_rad[r][1]= Dradiosity[Cr].val
                  G_rad[r][4]=Tgradiosity[Cr].val
         Blender.Draw.Redraw(1)
           
      elif (evt==618) :
         for r in range(3,len(G_rad)-1):
            Cr=clean(G_rad,r)
            if Cr!='media' or Cr!='normal':
               Dradiosity[Cr].val=D_defrad[Cr][int(Mradiosity.val-1)]
               Tgradiosity[Cr].val=1
               G_rad[r][1]= Dradiosity[Cr].val
               G_rad[r][4]=Tgradiosity[Cr].val
               
            Blender.Draw.Redraw(1)
            
      elif (evt>= Tnumb) and (evt<= Tnumb+Tnummax):
           for r in range(3,len(G_rad)-1):
              Cr=clean(G_rad,r)
              if Cr!='media' or Cr!='normal':   
                if evt==Tnumb+G_rad[r][5]:
                   G_rad[r][1]=Dradiosity[Cr].val
                   G_rad[r][4]=Tgradiosity[Cr].val
              elif Cr=='media' or Cr=='normal':
                if evt==Tnumb+G_rad[r][5]:
                   G_rad[r][4]=Dradiosity[Cr].val
                 
           for r in range(1,4):
              Cr=clean(G_rad,r)
              if Cr=='media' or Cr=='normal':   
                if evt==Tnumb+G_rad[r][5]:
                   G_rad[r][4]=Dradiosity[Cr].val

           Blender.Draw.Redraw(1)           

      elif (evt>= TRnumb) and (evt<= TRnumb+Tnummax):
           for r in range(1,len(G_rad)-1):
              Cr=clean(G_rad,r)
              if Cr!='media' and Cr!='normal':   
                if evt==TRnumb+G_rad[r][5]:
                   Cr=clean(G_rad,r)     
                   Dradiosity[Cr].val=G_rad[r][6]
                   
           Blender.Draw.Redraw(1)
         
      elif (evt==623) or (evt==624):     
              Blender.Draw.Redraw(1)


              
def DR_Photons():
    global Tphoton, Dphotons, Tphot, Tnumb, TlocalGT, TGlobRefl, TGlobMapVal
    global TGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
    global TFadeDistance,TFadePower, Tgphotons, TlightPower,SlightPower
    global TSky_sphere_povray, TSky_sphere_from_cam, TSky_s_fc_Scale
    global TMedia_Attenuation,  TAtmospheric_media, SMax_trace_level, TMax_trace_level
   
    TPnumb= Tphot
    TPRnumb=TPnumb+50 

    winPaint()
    #texte titre
    glRasterPos2d(20, 422)
    Text("Light Controls (2):")
    
    script=96;Povy=440;
    megawidth=(script+2)*3;megaheight=16;
    megax=20;megay=Povy-24;
    animwidth=script; animheight=16
    animx=40
    animy=megay-12

    c=[0.85,0.85,0.1,0.2]
    c1=[.1,.0,.0,1.0]

    r=[megax+script+24,megay-9*megaheight-8, megax+animwidth*3, megay-6]
    trace_rectangle3(r,c,c1)

    
    if Tphoton.val==1:

      if TlocalGT.val==1:
          Tphoton =Toggle('Photons on', PHOTONONBUTTON,
                          animx+script+8, animy+12, int(animwidth+script*0.7),
                          animheight, Tphoton.val, 'Are exported if lights cast photon and object reflection and refraction are set too.')
      else:
          Tphoton =Toggle('Photons on (not exported)', PHOTONONBUTTON,
                          animx+script+8, animy+12, int(animwidth+script*0.7),
                          animheight, Tphoton.val,'Global settings and local gt are not set.')

    else:
         Tphoton =Toggle('Photons off', PHOTONONBUTTON,
                         animx+script+8, animy+12, int(animwidth+script*0.7),
                         animheight, Tphoton.val,'To activate export set global settings+local gt')

    
    animy=animy-28

    if Tphoton.val==1:
       for r in range(1,len(G_phot)-1):
             Cr=clean(G_phot,r)
             if G_phot[r][1]!='20,100':
                if Tgphotons[Cr].val==1:
                     Dphotons[Cr]=Slider( Cr+' ',TPnumb+G_phot[r][5], animx-20, 
                                         animy-18*(r-1), animwidth+int(script*1.65+2),
                                         animheight, Dphotons[Cr].val, 
                                        G_phot[r][2],G_phot[r][3],0,'Activate parameter: choose the value.' )
                     
                     Tgphotons[Cr]=Toggle("A", 
                                  TPnumb+G_phot[r][5],
                                  animx+animwidth+int(script*1.65+2)-20, animy-18*(r-1),
                                  int(animwidth/4), animheight ,
                                  Tgphotons[Cr].val,'Toggle to desactivate this parameter')
 
                     Button("R", TPRnumb+G_phot[r][5] ,
                                 animx+animwidth+int(script*1.65+2), animy-18*(r-1),
                                 animwidth/4, animheight ,
                            'Reset')
                else:
                   Tgphotons[Cr]=Toggle(Cr+' %s' % round(Dphotons[Cr].val,3), 
                                  TPnumb+G_phot[r][5],
                                 animx+24, animy-18*(r-1), animwidth+(script+2),
                                 animheight, Tgphotons[Cr].val,'Toggle to activate this parameter')

                   Button("R", TPRnumb+G_phot[r][5] ,animx+24+animwidth+(script+2), 
                               animy-18*(r-1), animwidth/4, animheight ,'Reset')
             else:
                  pass
    
    else:
       for r in range(1,len(G_phot)-1):
             Cr=clean(G_phot,r); #print Cr
             if G_phot[r][1]!='20,100':
                  Tgphotons[Cr]=Toggle(Cr+' %s' % round(Dphotons[Cr].val,3), 
                                  TPnumb+G_phot[r][5],
                                 animx+24, animy-18*(r-1), animwidth+(script+2),
                                 animheight, Tgphotons[Cr].val,'Toggle to activate this parameter')

                  Button("R", TPRnumb+G_phot[r][5] ,animx+24+animwidth+(script+2), animy-18*(r-1), animwidth/4,
                                 animheight ,'Reset')

             else:
                  pass

    r=len(G_phot)+1

    animy=animy+28

    glRasterPos2d(animx+24, animy-19*(r-2))
    Text("Extra Light: set/unset fade distance.")

    if TFadeDistance.val==1.0:
        TFadeDistance=Toggle("Fade Distance",TPnumb-1,
                              animx+24, animy-19*(r-1)-4, 
                              (animwidth+script+24)/2,  animheight,
                              TFadeDistance.val,"To choose no Fade Distance")
        
        if TFadePower.val==1:
           TFadePower=Toggle("Fade Power = 1",TPnumb-2,
                              animx+24+int(script+animwidth+24)/2, animy-19*(r-1)-4, 
                              (animwidth+script+24)/2,animheight,
                              TFadePower.val,"To choose Fade Power")
        else:
           TFadePower=Toggle("Fade Power = 2",TPnumb-2,
                              animx+24+int(script+animwidth+24)/2, animy-19*(r-1)-4, 
                              (animwidth+script+24)/2,animheight,
                              TFadePower.val,"To choose Fade Power value")

    else:
        TFadeDistance=Toggle("No Fade Distance",TPnumb-1,
                              animx+24, animy-19*(r-1)-4, 
                              animwidth+script+24,animheight,
                              TFadeDistance.val,"To choose Fade Distance")

    glRasterPos2d(animx+24, animy-23*(r-2)-6)
    Text("Global Light Attenuation.")

    if TlightPower.val==1.0:
       SlightPower=Slider("Global Light",516,animx+24, animy-23*(r-1)-4, 
                              animwidth*2,animheight,
                              SlightPower.val,0.0,1.0,0,'Set unset global light power.')
       
       TlightPower=Toggle("Set Global Light",517,
                              animx+24+animwidth*2, animy-23*(r-1)-4, 
                              int(animwidth*0.3),animheight,
                              TlightPower.val,'Set unset global light power.')  
    else:
       TlightPower=Toggle("Set Global Light", 517,
                              animx+24, animy-23*(r-1)-4, 
                              int(animwidth*2.3),animheight,
                              TlightPower.val,'Set unset global light power.')
       
       
    c=[0.85,0.85,0.25,0.2]
    c1=[.1,.0,.0,1.0]
    rbis=[megax+script+24,megay-15*megaheight, megax+animwidth*3, megay-19*megaheight-6]
    trace_rectangle3(rbis,c,c1)
 
    glRasterPos2d(animx+24, animy-27*(r-2)-12)
    Text("Global Atmospheric Media: smoke....")

    #---------- 
    TAtmospheric_media=Toggle("Media Atmospheric",620,
                              animx+24, animy-26*(r-1)-16, 
                              int(animwidth*1.15),animheight,
                              TAtmospheric_media.val,'Atmospheric Media')  
     
    TMedia_Attenuation=Toggle("Media Attenuation",621,
                              animx+24+int(animwidth*1.15)+2, animy-26*(r-1)-16, 
                              int(animwidth*1.15),animheight,
                              TMedia_Attenuation.val,'Set Media Attenuation')

    glRasterPos2d(animx+24, animy-32*(r-2)-10)
    Text("Max Trace Level")

    if TMax_trace_level.val==1:
       TMax_trace_level=Toggle(" ON ",625, 
                                 animx+24, animy-30*(r-1)-16, int(animwidth*.5),
                                 animheight, TMax_trace_level.val,'Global setting : Max Trace Level')
       
       SMax_trace_level=Slider("Max Trace : ",626, 
                                 animx+24+int(animwidth*.5), animy-30*(r-1)-16, animwidth*2,
                                 animheight, SMax_trace_level.val,1,256,0,'Global setting : Max Trace Level')
    else:
       TMax_trace_level=Toggle("GS : Max Trace Level ",625, 
                                 animx+24, animy-30*(r-1)-16, int(animwidth*2.5),
                                 animheight, TMax_trace_level.val,'Global setting : Max Trace Level')


    l1='light Win 1';l1b='Windows to define new properties to materials and textures.'
    l2="Export to file";l2b='nothing'
    l3="Extra Material";l3b=''

    basdepagedraw(l1,l1b,l3,l3b,6)

   

def BE_Photons(evt):
      """
      
      """
      global Tphoton,TlocalGT, Texport, export
      global G_Set, G_Set0, G_rad, G_phot, Tnumb, Tphot
      global TGlobRefl, TGlobMapVal, TGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
      global TFadeDistance,TFadePower, TlightPower, SlightPower
      global format, debug, inifile, main, world, mesh, material,lamp,camera, export,expertmode
      global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial,Tlamp,Tcamera, Texport,Texpertmode
      global TSky_sphere_povray, TSky_sphere_from_cam, TSky_s_fc_Scale
      global TMedia_Attenuation,  TAtmospheric_media, SMax_trace_level, TMax_trace_level

      TPnumb=Tphot 
      TphotMax=len(G_phot)-1
      TPRnumb=TPnumb+50
      
      BasdepageBevent(evt,2,4)

      if (evt==PHOTONONBUTTON) or ((evt >=TPnumb) and (evt <=TPnumb+TphotMax)):
         for r in range(1,TphotMax): 
                if evt==TPnumb+G_phot[r][5]:
                   Cr=clean(G_phot,r)
                   if G_phot[r][1]=='off' and Dphotons[Cr].val==1:
                      G_phot[r][1]=='on'
                   elif G_phot[r][1]=='on' and Dphotons[Cr].val==0:
                      G_phot[r][1]=='off'
                   else:  
                      G_phot[r][1]=Dphotons[Cr].val
                   G_phot[r][4]=Tgphotons[Cr].val

         Blender.Draw.Redraw(1)
      
      elif (evt>= TPRnumb) and (evt<= TPRnumb+TphotMax):
           #print evt 
           for r in range(1,TphotMax): 
                if evt==TPRnumb+G_phot[r][5]:
                   Cr=clean(G_phot,r)
                   #print 'test ',Cr, 'test 2 ', evt
                   Dphotons[Cr].val=G_phot[r][6]
                   Blender.Draw.Redraw(1)
      
      elif (evt==TPnumb-1) or (evt==TPnumb-2) or (evt in [517,620,621,625,626]):
                   Blender.Draw.Redraw(1)

                   
                   
                     

def DR_Materials():
    global Texport, export
    global TGlobRefl, TGlobMapVal, TGlobPaintVal, SGlobRefl, SGlobMapVal
    global SGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
    global TFadeDistance,TFadePower, TInterpol, TInterpolType
    global TModifMaterial, Mtxtimg, menutxtimg,TGlobalWeight,Mmaterial
    global Mfilter,TAutoBump, SautoBumpsize
    global TAmbient, TMiroir, TTransmitAll, TVertexCol, TVerbose
    global TWireCub, TWireCyl, TWireBlob, TWireType, SWireDiam, TWireCubbis
    global SWirethreshold, TCompleteMaterial
    #global xptrueA_.b,xptrueA_.shown_object, xptrueA_.boardlist,xptrueA_.Tboardlist
    
    winPaint()

    glRasterPos2d(20, 422)
    Text("Extra Material and textures infos Windows")
    script=96;
    Povy=440;
    megawidth=(script+2)*3;
    megaheight=16;
    megax=20;
    megay=Povy-24;
    animwidth=script;
    animheight=16
    animx=40; animy=megay

    c=[0.85,0.85,0.1,0.2]
    c1=[.1,.0,.0,1.0]

    r=[megax+script-8,megay-15*megaheight, megax+animwidth*3, megay-20]
    trace_rectangle3(r,c,c1)
    
    if TModifMaterial.val==0:

      if TGlobRefl.val==1:
         SGlobRefl=Slider('Reflection Global Value', REFLECTIONGLOBALWEIGHT , #REFLACTIONGLOBAL=33
                          animx, animy-19*3,
                          animwidth+int(script*1.6+2),
                          animheight, SGlobRefl.val, 0.0, 1.0, 0,'Set Global Relection value for every object and every material')
         TGlobRefl=Toggle('A', REFLECTIONGLOBALWEIGHT ,animx+ animwidth+int(script*1.6+2), animy-19*3, int(animwidth*0.3), animheight, TGlobRefl.val, 'Activate Reflection value choise.' )
      else:
         TGlobRefl=Toggle('Reflection Value', REFLECTIONGLOBALWEIGHT ,
                          animx, animy-19*3, int(animwidth*2.8), animheight, TGlobRefl.val, 'Activate Reflection value choise.' )

      if TGlobMapVal.val==1:
         SGlobMapVal=Slider('UV Global Weight', UVGLOBALWEIGHT , #UVGLOBALWEIGHT=31
                            animx, animy-19*4, animwidth+int(script*1.6+2), animheight, SGlobMapVal.val, 0.0, 10.0, 0, 'Set map value in texture when they are blended with vertex paint.' )
         TGlobMapVal=Toggle('A', UVGLOBALWEIGHT ,
                            animx+ animwidth+int(script*1.6+2), animy-19*4, int(animwidth*0.3), animheight, TGlobMapVal.val, 'Activate map value choise.' )
      else:
         TGlobMapVal=Toggle('UV Global Weight', UVGLOBALWEIGHT ,
                            animx, int(animy-19*4), int(animwidth*2.8), animheight, TGlobMapVal.val, 'Activate map value choise.' )
     
      if TGlobPaintVal.val==1:
         SGlobPaintVal=Slider('Vertex Global Weight', 32 ,
                              animx, animy-19*5, animwidth+int(script*1.6+2), animheight, SGlobPaintVal.val, 0.0, 10.0, 0, 'Set vertex paint  value in texture when they are blended with texture map' )
         TGlobPaintVal=Toggle('A', 32 ,
                              animx+ animwidth+int(script*1.6+2), animy-19*5, int(animwidth*0.3), animheight, TGlobPaintVal.val, 'Activate vertex paint value choise.' )
      else:
         TGlobPaintVal=Toggle('Vertex Global Weight', 32 ,
                              animx, animy-19*5, int(animwidth*2.8), animheight, TGlobPaintVal.val, 'Activate vertex paint value choise.' )
     
      glRasterPos2d(animx, animy-17*7+6)
      glClearColor(c1[0],c1[1],c1[2],c1[3])
      Text("Smoothed Image Texture")      
      if TInterpol.val==1.0:
          TInterpol=Toggle("Interpolation",34,
                                animx,
                                int(animy-19*7 ), 
                                int(animwidth*2.8/2),  animheight,
                                TInterpol.val,"To choose no image interpolation for smoothed image texture")
          if TInterpolType.val==1.0:
             TInterpolType=Toggle("Type = 4",35,
                                int(animx+animwidth*2.8/2),
                                int(animy-19*7), 
                                int(animwidth*2.8/2),animheight,
                                TInterpolType.val,"To choose Fade Power")
          else:
             TInterpolType=Toggle("Type = 2",35,
                                int(animx+animwidth*2.8/2),
                                int(animy-19*7),  
                                int(animwidth*2.8/2),
                                 animheight,
                                TInterpolType.val,"To choose Fade Power value")
      else:
          TInterpol=Toggle("No interpolation",34,
                                animx, animy-19*7, 
                                int(animwidth*2.8),
                                animheight,
                                TInterpol.val,"To choose image interpolation for smoothed image texture")
     
      glRasterPos2d(animx, animy-22*7+2)
      glClearColor(c1[0],c1[1],c1[2],c1[3])
      Text("Auto Bump_map")
      if TAutoBump.val==1.0:
         TAutoBump=Toggle("Auto Bump Map",600,
                                animx, animy-25*7+4, 
                                int(animwidth*0.8),animheight,
                                TAutoBump.val,"To connect automatic bump mapping to every material with UV texture of the selected object")
     
         Button('Select object',601,int(animx+animwidth*0.8+4), animy-25*7+4, 
                                animwidth*2,animheight,'Connect uv bump_map to every material of the selected object')
     
         Mmaterial= Menu(menumaterial,42, animx, animy-28*7+4, 
                                animwidth*2,animheight,Mmaterial.val,'Show material state.')
         
         Button('Free',603,animx+animwidth*2, animy-28*7+4, 
                                int(animwidth*0.8),animheight,'Remove bump_map from every material of the selected object.')
         
         SautoBumpsize=Slider('Bump size', 602 ,animx, animy-31*7+4, 
                                int(animwidth*2.8),animheight, SautoBumpsize.val, 0.0, 30.0,0,"Seletc the power of the normal effet.")
        
      else:  
          TAutoBump=Toggle("Auto Bump Map",600,
                                animx, animy-25*7+4, 
                                int(animwidth*2.8),animheight,
                                TAutoBump.val,"To connect automatic bump mapping to every material with UV texture of the selected object")

      TAmbient=Toggle("Minimal Ambient",604,
                                animx, animy-35*7+4, 
                                int(animwidth*1.35),animheight,
                                TAmbient.val,"")
      

      TMiroir=Toggle("Miroir",605,
                                int(animx+animwidth*1.4), animy-35*7+4, 
                                int(animwidth*1.35),animheight,
                                TMiroir.val," Inverse reflection control value. ")

      TTransmitAll=Toggle("AlphaCol to Map",606,
                                animx, animy-38*7+4, 
                                int(animwidth*1.35),animheight,
                                TTransmitAll.val," Give color alpha value to the image map. We do not need of this if uv pict has an alpha channel")

      TVertexCol=Toggle("Control VertexCol",607,
                                int(animx+animwidth*1.4), animy-38*7+4, 
                                int(animwidth*1.35),animheight,
                                TVertexCol.val," for Blender vertex paint, only if an uvmap is exported too.")

      TVerbose=Toggle("Verbose",608,
                                animx+animwidth*2, animy-46*7, 
                                int(animwidth*.8),int(animheight*0.8),
                                TVerbose.val," Off : no echo in the console.")
      
##-------------------------------------------ajout du 19/09/2003
      TCompleteMaterial=Toggle("Complete Material",614,
                                animx, animy-46*7, 
                                int(animwidth*1.2) ,int(animheight*0.8),
                                TCompleteMaterial.val,"Add interior and normal definitions to each exported material")

      #------------------------------
      #
      #
      #-------------------------------
      if TWireType.val==1.0:
         TWireType= Toggle("Wire",617,
                                animx, animy-44*7+4, 
                                int(animwidth*.4),int(animheight*2.1),
                                TWireType.val," Control wire material export")

         TWireCyl= Toggle("Cylinder",609,
                                   int(animx+animwidth*0.84), animy-41*7, 
                                   int(animwidth*.6),animheight,
                                   TWireCyl.val," Select Cylinder Shape for wire")

         TWireCub= Toggle("Cube",610,
                                   int(animx+animwidth*0.42), animy-41*7, 
                                   int(animwidth*.4),animheight,
                                   TWireCub.val,"Select Cube Shape for wire")
         
         TWireBlob= Toggle("Blob",611,
                                   int(animx+animwidth*.42), animy-44*7+4, 
                                   int(animwidth*.5),animheight,
                                   TWireBlob.val,"Seelct Blob Shape for wire")
         if TWireBlob.val==1:
                  SWirethreshold= Slider("Threshold    :",616,
                                   int(animx+animwidth*0.94), animy-44*7+4, 
                                   int(animwidth*1.9),animheight,SWirethreshold.val,0.0,1.0,
                                   0,"For Blob only")


         SWireDiam= Slider("Diam    :",DIAMETREBUTTON,
                                   int(animx+animwidth*1.5), animy-41*7, 
                                   int(animwidth*1.3),animheight,SWireDiam.val,0.0,1.0,
                                   0,"Cylinder Radius or cube edge:")
         
      else:
         TWireType= Toggle("Wire",617,
                                animx, animy-44*7+4, 
                                animwidth,
                                int(animheight*2.1),
                                TWireType.val,"")

      TModifMaterial=Toggle("Material Design interface",40,
                                animx+animwidth,
                                int(animy-19*1.5) , 
                                int(animwidth*1.8),
                                animheight,
                                TModifMaterial.val)
        
      TGlobalWeight=Toggle("Global Value",41,
                                animx,
                                int(animy-19*1.5) , 
                                animwidth,  animheight,
                                TGlobalWeight.val)
        
    else:
      TModifMaterial=Toggle("Material Design Interface",40,
                                animx+animwidth,
                                int(animy-19*0.9), 
                                int(animwidth*1.8),
                                animheight,
                                TModifMaterial.val)
     
      TGlobalWeight=Toggle("Global Value",41,
                                animx,
                                int(animy-19*0.9) , 
                                animwidth,  animheight,
                                TGlobalWeight.val)
     
      glRasterPos2d(animx, animy-19*1.85+2)
      Text("  Select your Material:")
      #Mmaterial,menumaterial
      Mmaterial= Menu(menumaterial,42,int(animx+animwidth*1.4), int(animy-19*1.95), 
                                int(animwidth*1.4),  animheight , Mmaterial.val)
     
      Button('Init',43,14, int(animy-19*3.8), 
                                int(animwidth*0.5),  animheight*2 )
      
      if xptrueA_.shown_object in ['finish','pigment']:
        Badd='reMov'
      else:
        Badd='Add'
      
      Button(Badd,44,int(animx+animwidth*0.26), int(animy-19*2.95), 
                                int(animwidth*0.63),  animheight )
     
      Button('Modify',45,int(animx+animwidth*(0.26+0.63*1)),int( animy-19*2.95), 
                                int(animwidth*0.63),  animheight )
      
      Button('Save',46,int(animx+animwidth*(0.26+0.63*2)), int(animy-19*2.95), 
                                int(animwidth*0.63),  animheight )
     
      Button('Load',47,int(animx+animwidth*(0.26+0.63*3)), int(animy-19*2.95), 
                                int(animwidth*0.63),  animheight )
      
      xptrueA_.selectpovobject(xptrueA_.boardlist,
                               xptrueA_.Tboardlist,
                               xptrueA_.Nboardlist,
                               50,
                               xptrueA_.shown_object,
                               dim)
     
      butt.draw_buttons(xptrueA_.shown_object)
     
    l1="Light win2";l1b=''
    l3="Focal ";l3b='Focal blur and camera attributes'
    basdepagedraw(l1,l1b,l3,l3b,7)
           
         
def BE_Materials(evt):
      global Texport, export
      global TGlobRefl, TGlobMapVal, TGlobPaintVal, SGlobRefl, SGlobMapVal
      global SGlobPaintVal, GlobRefl, GlobMapVal, GlobPaintVal
      global TFadeDistance,TFadePower
      global TModifMaterial,Mtxtimg, menutxtimg,TGlobalWeight,boardBlimit
      global Mmaterial, menumaterial
      global format, debug, inifile, main, world, mesh, material,lamp,camera, export,expertmode
      global Tformat, Tdebug, Tinifile, Tmain, Tworld, Tmesh, Tmaterial
      global Tlamp,Tcamera, Texport,Texpertmode, TAutoBump, SautoBumpsize
      global TAmbient, TMiroir, TTransmitAll,  TVertexCol, TVerbose
      global TWireCub, TWireCyl, TWireBlob, TWireType, SWireDiam, TWireCubbis
      global SWirethreshold, TCompleteMaterial
    
      BasdepageBevent(evt,3,5)
         
      if (evt==UVGLOBALWEIGHT):
                  GlobMapVal=SGlobMapVal.val
                  Blender.Draw.Redraw(1)
                  
      elif (evt==32):
                  GlobPaintVal=SGlobPaintVal.val
                  Blender.Draw.Redraw(1)
                   
      elif (evt==REFLECTIONGLOBALWEIGHT):
                  GlobRefl=SGlobRefl.val
                  Blender.Draw.Redraw(1)
                   
      elif (evt==34) or (evt==35):
                  Blender.Draw.Redraw(1)
               
      elif (evt==40):
            if TModifMaterial.val==1:
               TGlobalWeight.val=0 
            if TModifMaterial.val==0:
               TGlobalWeight.val=1
            Blender.Draw.Redraw(1)
            Blender.Draw.Redraw(1)
          
      elif (evt==41):
            if TGlobalWeight.val==0:
               TModifMaterial.val=1
            if TGlobalWeight.val==1:
              TModifMaterial.val=0
            Blender.Draw.Redraw(1)
            Blender.Draw.Redraw(1)
         
      elif (evt==42):
           Blender.Draw.Redraw(1)
           
      elif (evt==43):
            xptrueA_.initcf=[.60,.80,0.30,0.2]
            xptrueA_.init_materielInterface(xptrueA_.mat_dico,
                                            xptrueA_.MATcorNameLIST,
                                            xptrueA_.MATNameLIST,
                                            xptrueA_.MATLIST,5)
            
            for d in xptrueA_.mat_dico.keys():
                 for d1 in  xptrueA_.mat_dico[d].keys():
                    if d1 not in  butt.GUI[d][0][4]:
                         butt.GUI[d][0][4].append(d1)
                         
            Blender.Draw.Redraw(1)
                         
      elif  (evt==44):
           #print xptrueA_.MATNameLIST[Mmaterial.val-1]
              
           if xptrueA_.shown_object=='normal':
              if xptrueA_.VERBOSE==1:  print 'butt.GUI[xptrueA_.shown_object][1][-3]',butt.GUI[xptrueA_.shown_object][1][-3]
              b0=butt.GUI['submenu'][butt.GUI[xptrueA_.shown_object][1][-3]].val
                 
              if xptrueA_.VERBOSE==1: print 'butt.GUI[xptrueA_.shown_object][1][-2]',butt.GUI[xptrueA_.shown_object][1][-2], b0 , butt.GUI['normallist'][0][4]
              addmat0= butt.GUI['normallist'][0][4][b0-1]
                 
              if addmat0!='None':
                 addmat1=xptrueA_.shown_object                                     
                 addmat=[addmat0,addmat1]
                 xptrueA_.Extramat['Add'][xptrueA_.MATcorNameLIST[Mmaterial.val-1]]=addmat
                 if xptrueA_.VERBOSE==1: print "xptrueA_.Extramat['Add']: ",xptrueA_.Extramat['Add']
                 
              else:
                  try:
                    del xptrueA_.Extramat['Add'][xptrueA_.MATcorNameLIST[Mmaterial.val-1]]
                  except:
                    pass
                 
              xptrueA_.MATLIST,xptrueA_.MATcorNameLIST,xptrueA_.MATNameLIST,menumaterial=xptrueA_.getmat(xptrueA_.Extramat)
              
              Blender.Draw.Redraw(1)

      elif  (evt==46):
           #xptrueA_.VERBOSE=1
           if xptrueA_.VERBOSE==1: print xptrueA_.MATNameLIST[Mmaterial.val-1]
           if xptrueA_.shown_object=='colors':
              if xptrueA_.VERBOSE==1:
                 print 'butt.GUI[xptrueA_.shown_object][1][-3]',butt.GUI[xptrueA_.shown_object][1][-3]
           #xptrueA_.VERBOSE==0
           Blender.Draw.Redraw(1)
                 
      elif (evt==601):
                O=None 
                if BL_VERSION>=228 or BL_VERSION==223:
                   try:
                     O=Blender.Object.GetSelected()[0]
                   except:
                     print "None object selected.....\n\n\n\n" 


                elif BL_VERSION<228 and BL_VERSION>=225:
                   try:
                     O=Blender.Object.getSelected()[0]
                   except:
                     print "None object selected.....\n\n\n\n" 

                if O!=None:
                 if BL_VERSION>223 :
                   if O.getType()=='Mesh' and O.getData().hasFaceUV():
                      OMats=O.data.materials
                      for M in OMats:
                        corName=xptrueA_.clean_name(M.name)
                        addmat=[round(SautoBumpsize.val,4),'autoBump']
                        xptrueA_.Extramat['Add'][corName]=addmat
                      xptrueA_.MATLIST,xptrueA_.MATcorNameLIST,xptrueA_.MATNameLIST,menumaterial=xptrueA_.getmat(xptrueA_.Extramat,'AB')
                
                 if BL_VERSION==223 :
                   if O.data.block_type=='NMesh' and O.data.hasFaceUV():
                      OMats=O.data.mats
                      for M in OMats:
                        corName=xptrueA_.clean_name(M)
                        addmat=[round(SautoBumpsize.val,4),'autoBump']
                        xptrueA_.Extramat['Add'][corName]=addmat
                      xptrueA_.MATLIST,xptrueA_.MATcorNameLIST,xptrueA_.MATNameLIST,menumaterial=xptrueA_.getmat(xptrueA_.Extramat,'AB')
                    
      elif (evt==603):
             try: 
                if BL_VERSION>=228 or BL_VERSION==223:
                   O=Blender.Object.GetSelected()[0]
                elif BL_VERSION<228 and BL_VERSION>=225:
                   O=Blender.Object.getSelected()[0]
                if BL_VERSION>223:
                  if O.getType()=='Mesh' and O.getData().hasFaceUV():
                    OMats=O.data.materials
                    for M in OMats:
                      corName=xptrueA_.clean_name(M.name)
                      try:
                         del xptrueA_.Extramat['Add'][corName]
                         xptrueA_.MATLIST,xptrueA_.MATcorNameLIST, xptrueA_.MATNameLIST, menumaterial=xptrueA_.getmat(xptrueA_.Extramat)
                      except:
                         pass
             
                elif BL_VERSION==223:
                    if O.data.block_type=='NMesh' and O.data.hasFaceUV():
                      OMats=O.data.mats
                    for M in OMats:
                      corName=xptrueA_.clean_name(M)
                      try:
                         del xptrueA_.Extramat['Add'][corName]
                         xptrueA_.MATLIST,xptrueA_.MATcorNameLIST,xptrueA_.MATNameLIST,menumaterial=xptrueA_.getmat(xptrueA_.Extramat)
                      except:
                         pass
             except:
                last_error=" No selected object. "
                print last_error

##TAmbient, TMiroir, TTransmitAll,  TVertexCol, TVerbose
                        
      elif (evt==604):                 
        xptrueA_.AMBIENT=int(TAmbient.val)
         
      elif (evt==605):                 
        xptrueA_.MIROIR=int(TMiroir.val)
          
      elif (evt==606):                 
        xptrueA_.TRANSMITALL=int(TTransmitAll.val)
           
           
      elif (evt==607):                 
        xptrueA_.VERTEXCOL=int(TVertexCol.val)
          
      elif (evt==608):                 
        xptrueA_.VERBOSE=int(TVerbose.val)
        
##-------------------------------------------ajout du 19/09/2003
      elif (evt==614):                 
        xptrueA_.COMPLETEMATERIAL=int(TCompleteMaterial.val)

      elif (evt==609):                 
        if TWireCub.val==1:
           TWireCub.val=0
        if TWireBlob.val==1:
           TWireBlob.val=0
        if TWireCubbis.val==1:
           TWireCubbis.val=0

        Blender.Draw.Redraw(1)
        
      elif (evt==PROFILESBUTTON):                 
        if TWireCyl.val==1:
           TWireCyl.val=0
        if TWireBlob.val==1:
           TWireBlob.val=0
        if TWireCubbis.val==1:
           TWireCubbis.val=0

        Blender.Draw.Redraw(1)

      elif (evt==611):                 
        if TWireCyl.val==1:
           TWireCyl.val=0
        if TWireCub.val==1:
           TWireCub.val=0
        if TWireCubbis.val==1:
           TWireCubbis.val=0
        Blender.Draw.Redraw(1)

      elif (evt==616):
        """
        if TWireCyl.val==1:
           TWireCyl.val=0
        if TWireCub.val==1:
           TWireCub.val=0
        if TWireBlob.val==1:
           TWireBlob.val=0
        """  
        Blender.Draw.Redraw(1)
        pass
        
      elif  (evt==DIAMETREBUTTON):
          Blender.Draw.Redraw(1)

      elif  (evt==617):
          Blender.Draw.Redraw(1)
          
      butt.event_holder(evt,xptrueA_.shown_object,boardBlimit)
      Blender.Draw.Redraw(1)
      
      print xptrueA_.shown_object,': ', xptrueA_.Nboardlist[xptrueA_.boardlist.index(xptrueA_.shown_object)]
      print xptrueA_.Nboardlist

      for b in xptrueA_.boardlist:
         #print evt, b
         if (evt==xptrueA_.boardlist.index(b)+50):
               xptrueA_.shown_object=b
               butt.swap_data(xptrueA_.shown_object)  
      Blender.Draw.Redraw(1)

#--------------------------------------------------------
#  Focal Blur Alias Window
#--------------------------------------------------------
def DR_Render():
    global Tfocal_blur, Talias, Vfocalpoint, Saperture, Svariance, Sconfidence, Sblursamples
    global Taperture, Tvariance, Tconfidence, Tblursamples, Tmegapovpath, Tdof, Tmoredof
    global plane1, plane2, TBlenderSize
    global TAAlias, TmoreAAlias, TAASampling_method, TAA_threshold, TJitter
    global SJitter_Amount, TAA_Depth, SAA_Depth, SAA_threshold, TQuality, SQuality
      
    winPaint()
    glRasterPos2d(20, 422)
    Text("Focal Blur, Anti-alias and Quality")
     
    script=96;
    Povy=440;
    megawidth=(script+2)*3;
    megaheight=16;
    megax=20;
    megay=Povy;
    animwidth=script;
    animheight=16
    animx=40;
    animy=megay
     
    if Tfocal_blur.val==1 or Tdof.val==1:
        if Tfocal_blur.val==1:  
            Tfocal_blur  = Toggle('Focal Blur',  FOCALBLUR, #FOCALBLUR=630
                                  animx, animy-19*3, int(animwidth*2.8), animheight, Tfocal_blur.val, 'Activate Focal Blur values choise.' )
            Button('Select an object as focal point',631,
                   animx, animy-19*4, int(animwidth*2.8), animheight,"Select object")
            if Taperture.val==1:
               Taperture=Toggle('A', FOCALBLUR ,
                                animx+ int(animwidth*2.52), animy-19*5, int(animwidth*0.3), animheight, Taperture.val, 'Activate Reflection value choise.' )
               Saperture    = Slider('Aperture',  FOCALBLUR ,
                                     animx, animy-19*5, int(animwidth*2.5), animheight, Saperture.val, 0.0, 4.0, 0,'')
            else:
               Taperture=Toggle('No Aperture', FOCALBLUR ,
                                animx, animy-19*5, animwidth+int(script*1.6+2), animheight, Taperture.val, 'Activate Reflection value choise.' )
               
        elif Tdof.val==1:
            Tdof  = Toggle('Deep of Field',  FOCALBLUR,
                           animx, animy-19*3, int(animwidth*2.8), animheight, Tdof.val, 'Activate Focal Blur values choise.' )
            Button('1st plane',632,
                   animx, animy-19*4, int(animwidth*1.4), animheight,"Select an object to locate the first plane of sharpness")
            Button('2nd plane',633,
                   animx+int(animwidth*1.4), animy-19*4, int(animwidth*1.4), animheight,"Select an object to locate the end plane of sharpness")
            Button('Aperture :%s'%Saperture.val, 634 ,
                   animx, animy-19*5, animwidth+int(script*1.6+2), animheight,"Calculate Aperture and focal point for this deep of field")
             
        if Tblursamples.val==1:
            Tblursamples=Toggle('A', FOCALBLUR ,
                                animx+ int(animwidth*2.52), animy-19*6, int(animwidth*0.3), animheight, Tblursamples.val, 'Increase for better results.' )
            Sblursamples    = Slider('blur samples',  FOCALBLUR ,
                                     animx, animy-19*6, int(animwidth*2.5), animheight, Sblursamples.val, 0, 600, 0,'')
        else:
            Tblursamples=Toggle('No blur samples', FOCALBLUR ,
                                animx, animy-19*6, int(animwidth*2.8), animheight, Tblursamples.val, 'Increase for better results.' )
            
        if Tmoredof.val==1:
          Tmoredof=Toggle('More...', FOCALBLUR ,
                          animx, animy-19*7, int(animwidth*0.5), animheight, Tmoredof.val, 'Show more value. : variance and confidence')
          if Tvariance.val==1:
              Tvariance=Toggle('A', FOCALBLUR ,
                               animx+ animwidth+int(script*1.6+2), animy-19*8, int(animwidth*0.3), animheight, Tvariance.val, 'Decrease for better results.' )
              Svariance    = Slider('variance',  FOCALBLUR ,
                                    animx, animy-19*8, int(animwidth*2.5), animheight, Svariance.val, 0.0, 90.0, 0,'Decrease for better results.')
          else:
              Tvariance=Toggle('No variance', FOCALBLUR ,
                               animx, animy-19*8, animwidth+int(script*1.6+2), animheight, Tvariance.val, 'Decrease for better results.' )
              
          if Tconfidence.val==1:
              Tconfidence=Toggle('A', FOCALBLUR ,
                                 animx+ animwidth+int(script*1.6+2), animy-19*9, int(animwidth*0.3), animheight, Tconfidence.val, 'Increase for better results.' )
              Sconfidence   = Slider('Sconfidence',  FOCALBLUR ,
                                     animx, animy-19*9, int(animwidth*2.5), animheight, Sconfidence.val, 0.9, 1.0, 0,'Increase for better results.')
          else:
              Tconfidence=Toggle('No confidence', FOCALBLUR ,
                                 animx, animy-19*9, int(animwidth*2.8), animheight, Tconfidence.val, 'Increase for better results.' )
        else:
          Tmoredof=Toggle('More...', FOCALBLUR ,
                          animx, animy-19*7, int(animwidth*0.5), animheight, Tmoredof.val, 'Show more value. : variance and confidence')
          
    else:
         Tfocal_blur=Toggle('Focal Blur',  FOCALBLUR,
                            animx, animy-19*3, int(animwidth*1.4), animheight, Tfocal_blur.val, 'Activate Focal Blur board.' )
         Tdof=Toggle('Deep of field',  FOCALBLUR,
                     animx+ int(animwidth*1.4), animy-19*3, int(animwidth*1.4), animheight, Tdof.val, 'Activate deep of field board.' )
         
    Aliasval=640
    
    if TAAlias.val==1:
        TAAlias=Toggle('Advanced AntiAliasing Settings',  Aliasval,
                       animx, animy-19*11, int(animwidth*2.8), animheight, TAAlias.val, '' )
          
        if TAA_threshold.val==1:
           SAA_threshold=Slider('AA threshold',  Aliasval+1 ,
                                animx, animy-19*12, int(animwidth*2.5), animheight, SAA_threshold.val, 0.0, 1.0, 0,'')
           TAA_threshold=Toggle('A',  Aliasval+2,
                                animx+ int(animwidth*2.52), animy-19*12, int(animwidth*0.3), animheight, TAA_threshold.val, '' )
        else:
           TAA_threshold=Toggle('AA_threshold',  Aliasval+1 ,
                                animx, animy-19*12, int(animwidth*2.8), animheight, TAA_threshold.val, '' )
         
        if TJitter.val==1:   
            SJitter_Amount=Slider('Jitter Amount ',  Aliasval+4 ,
                                  animx, animy-19*13, int(animwidth*2.5), animheight, SJitter_Amount.val, 0.0, 1.0, 0,'')
            TJitter=Toggle('A',  Aliasval+3 ,
                           int(animx+animwidth*2.52), animy-19*13, int(animwidth*0.3), animheight, TJitter.val, '' )
        else:
            TJitter=Toggle('Jitter ',  Aliasval+3 ,
                           animx, animy-19*13, int(animwidth*2.8), animheight, TJitter.val, '' )
          
        if TAA_Depth.val==1:
            SAA_Depth=Slider('AA Depth ',  Aliasval+5 ,
                             animx, animy-19*14, int(animwidth*2.5), animheight, SAA_Depth.val, 1, 9, 0,'')
            TAA_Depth=Toggle('A ',  Aliasval+4 ,
                             animx+ int(animwidth*2.52), animy-19*14, int(animwidth*0.3), animheight, TAA_Depth.val, '' )
        else:
            TAA_Depth=Toggle('AA Depth ',  Aliasval+4 ,
                             animx, animy-19*14, int(animwidth*2.8), animheight, TAA_Depth.val, '' )
            
        TAASampling_method=Toggle('AA Sampling Method ',  Aliasval+6 ,
                                  animx, animy-19*15, int(animwidth*2.8), animheight, TAASampling_method.val, 'off=1, on=2' )
    else:
      TAAlias=Toggle('Advanced AntiAliasing Settings',  Aliasval,
                     animx, animy-19*11, int(animwidth*2.8), animheight, TAAlias.val, '' )
     
     
    if TQuality.val==1:
           SQuality=Slider('Quality : ',  Aliasval+1 ,
                           animx, animy-19*18, int(animwidth*2.8), animheight, SQuality.val, 1, 11, 0, qualityTABhelp[SQuality.val])
           TQuality=Toggle('Quality Setting',  Aliasval+1 ,
                           animx, animy-19*17, int(animwidth*2.8), animheight, TQuality.val, qualityTABhelp[SQuality.val] )
    else:
           TQuality=Toggle('Quality Setting',  Aliasval+1 ,
                           animx, animy-19*17, int(animwidth*2.8), animheight, TQuality.val, qualityTABhelp[SQuality.val] )
     
     
    l1='Extra Mat';l1b='Extra material infos/choise and Material Design Interface'
    l3='Global Set';l3b='Others Global Settings'
    basdepagedraw(l1,l1b,l3,l3b,4)
     
     
def BE_Render(evt):
      global Tfocal_blur, Vfocalpoint, Saperture, Svariance, Sconfidence, Tdof, Tmoredof
      global Taperture, Tvariance, Tconfidence, Tblursamples, Sblursamples,Tmegapovpath, NxSize
      global plane1, plane2, xptrueA_,TBlenderSize
      global TAAlias, TmoreAAlias, TAASampling_method, TAA_threshold, TJitter
      global SJitter_Amount, TAA_Depth, SAA_Depth, SAA_threshold, TQuality, SQuality
      
      if evt==FOCALBLUR:
         Blender.Draw.Redraw()
         
      elif evt==631:
        try:

          if BL_VERSION>=228 or BL_VERSION==223:
                   O=Blender.Object.GetSelected()[0]
          elif BL_VERSION<228 and BL_VERSION>=225:
                   O=Blender.Object.getSelected()[0]

          Vfocalpoint[0]=O.mat[3][0]
          Vfocalpoint[1]=O.mat[3][1]
          Vfocalpoint[2]=O.mat[3][2]          
        except:
          pass
        
      elif evt==632:
         try:
          if BL_VERSION>=228 or BL_VERSION==223:
             plane1=Blender.Object.GetSelected()[0]
          elif BL_VERSION<228 and BL_VERSION>=225:
             plane1=Blender.Object.getSelected()[0]
         except:
            last_error="No plane or object selected"
            print last_error
            
      elif evt==633:
         try:
          if BL_VERSION>=228 or BL_VERSION==223:
             plane2=Blender.Object.GetSelected()[0]
          elif BL_VERSION<228 and BL_VERSION>=225:
             plane2=Blender.Object.getSelected()[0]
         except:
            last_error="No plane or object selected"
            print last_error
            
      elif evt==634:
            if TBlenderSize.val==1.0:  
               Width=NxSize.val
            else:
               # ---------------------
               #   modification 228   
               # ---------------------
               if BL_VERSION>223 and BL_VERSION<233:
                  Width=Blender.Scene.getCurrent().getWinSize()[0]
               elif BL_VERSION==223:
                  import Blender210
                  Width=Blender210.getDisplaySettings().xResolution
               elif BL_VERSION>=233:
                  Width=Blender.Scene.getCurrent().getRenderingContext().imageSizeX()

               # ---------------------
               #   modification 228   
               # ---------------------
            try:   
              if BL_VERSION>223:
                  c = Blender.Scene.getCurrent().getCurrentCamera()
              else:
                  import Blender210
                  c=Blender210.getCurrentScene().getCurrentCamera()
              print str(plane1),str(plane2),str(c)
              Saperture.val,Vfocalpoint=xptrueA_.DeepOField(plane1, plane2, c, Width)
            except:
              print "no camera"
              
      elif evt in [640,641,642,643,644,645,646]:
            pass
          
      BasdepageBevent(evt,4,6)
      Blender.Draw.Redraw()

def menu_imageOutput(place,animy,animx,animwidth,animheight):
     global MImgOutputType,Nbitperplane,imageOutputTips
     
     glRasterPos2d(40,animy-19*(place-1)+4) 
     Text("To select the output file Type :")
     if MImgOutputType.val in [5,6,8]:
        longueur=int(animwidth*1.5)
        if  MImgOutputType.val==8:
            maxbit=8
        else:
            maxbit=16
        Nbitperplane=Slider('bits',661,animx+longueur, animy-19*place+2,int(longueur*0.86), animheight, Nbitperplane.val,5,maxbit,0,'maximum bits per color' )
     else:
         longueur=int(animwidth*2.8) 
     MImgOutputType=Menu(imageOutputMenu,660,animx, animy-19*place+2,longueur, animheight, MImgOutputType.val,imageOutputTips[MImgOutputType.val-1])

#--------------------------------------------------------
#  Others Global Settings Windows
#--------------------------------------------------------
def DR_OtherSettings():
    global TLamp_definition, SLamp_SpreadX, SLamp_SpreadZ
    global SLamp_GridX, SLamp_GridZ, SLamp_adaptive, TLamp_jitter
    global TLamp_circular, TLamp_orient, MImgOutputType, imageOutputMenu, imageOutputTips, Nbitperplane
      
    winPaint()
    glRasterPos2d(20, 422)
    Text("Others Global Settings Window: Area light and Wire")
     
    script=96;
    Povy=440;
    megawidth=(script+2)*3;
    megaheight=16;
    megax=20;
    megay=Povy;
    animwidth=script;
    animheight=16
    animx=40;
    animy=megay
         
    if TLamp_definition.val==1:
            TLamp_definition  = Toggle('General Area Light definition',  650 ,animx, animy-19*3, int(animwidth*2.8), animheight, TLamp_definition.val, 'change standard of area_light options.' )
            
            SLamp_SpreadX = Slider('SLamp_SpreadX',  650 ,animx, animy-19*4, int(animwidth*2.5), animheight, SLamp_SpreadX.val, 1, 10, 0,'')
            SLamp_SpreadZ =Slider('SLamp_SpreadZ',  650 ,animx, animy-19*5, int(animwidth*2.5), animheight, SLamp_SpreadZ.val, 1, 10, 0,'')
            SLamp_GridX =Slider('Area Grid Z ',  650 ,animx, animy-19*6, int(animwidth*2.5), animheight, SLamp_GridX.val, 1, 12, 0,'')
            SLamp_GridZ =Slider('Area Grid Z ',  650 ,animx, animy-19*7, int(animwidth*2.5), animheight, SLamp_GridZ.val, 1, 12, 0,'')
            SLamp_adaptive =Slider('SLamp_adaptive',  650 ,animx, animy-19*8, int(animwidth*2.5), animheight, SLamp_adaptive.val, 0, 10, 0,'')
            
            TLamp_jitter=Toggle('Lamp Jitter',  650 ,animx, animy-19*9, int(animwidth*2.8), animheight, TLamp_jitter.val, 'Set/unset Jitter.' )
            TLamp_circular=Toggle('Lamp Circular',  650 ,animx, animy-19*10, int(animwidth*2.8), animheight, TLamp_circular.val, 'Set/unset circular shape.' )
            TLamp_orient=Toggle('Lamp orient',  650 ,animx, animy-19*11, int(animwidth*2.8), animheight, TLamp_orient.val, 'Set/unset orientation to area light.' )
            menu_imageOutput(13,animy,animx,animwidth,animheight)
    else: 
            TLamp_definition  = Toggle('General Lamp definition',  650,animx, animy-19*3, int(animwidth*2.8), animheight, TLamp_definition.val, 'change standard of area_light options.' )
            menu_imageOutput(5,animy,animx,animwidth,animheight)

    
    l1='Focal';l1b='Focal blurr and anti-alias'
    l3='Paths Set';l3b='Paths Settings'
    
    basdepagedraw(l1,l1b,l3,l3b,4)

def BE_OtherSettings(evt):
    global TLamp_definition, SLamp_SpreadX, SLamp_SpreadZ
    global SLamp_GridX, SLamp_GridZ, SLamp_adaptive, TLamp_jitter
    global TLamp_circular, TLamp_orient
    
        
    BasdepageBevent(evt,5,7)
    Blender.Draw.Redraw()




#--------------------------------------------------------
#  Others Global Settings Windows
#--------------------------------------------------------
def DR_Paths():
    global TLamp_definition, SLamp_SpreadX, SLamp_SpreadZ
    global SLamp_GridX, SLamp_GridZ, SLamp_adaptive, TLamp_jitter
    global TLamp_circular, TLamp_orient, MImgOutputType
    global imageOutputMenu, imageOutputTips, Nbitperplane
    global P_PATH, povpath
    
    winPaint()
    glRasterPos2d(20, 422)
    Text("Paths")
    PathsX = 30
    Pathswidth = 200
    Pathsheight = 20
    PathsH=44
    PathsY = 422-10

    Pathslength=256
    for p in P_PATH :
       #glRasterPos2i(PathsX, PathsY-PathsH+24)
       #Text(povpath[P_PATH.index(p)])
       p[2]=Toggle(povpath[P_PATH.index(p)],
                   1024, PathsX, PathsY-PathsH+22,
                   90, 18, p[2].val )
       if p[2].val :
         print povpath[P_PATH.index(p)]
         p[1]=String("",
                        1024, PathsX, PathsY-PathsH,
                        Pathswidth, Pathsheight,
                        p[1].val,
                        Pathslength   )
         p[0]=String("",1024,PathsX+Pathswidth+2, PathsY-PathsH,
                        80, Pathsheight,
                        p[0].val,
                        Pathslength   )
         PathsY-=PathsH
       else :
         PathsY-=(PathsH-22)
           
       
    l1='Global Set';l1b='Various Globla settings'
    l3='Main win 1';l3b='Main windows'
    basdepagedraw(l1,l1b,l3,l3b,4)

def BE_Paths(evt):
    global TLamp_definition, SLamp_SpreadX, SLamp_SpreadZ
    global SLamp_GridX, SLamp_GridZ, SLamp_adaptive, TLamp_jitter
    global TLamp_circular, TLamp_orient 
    
        
    BasdepageBevent(evt,6,1)
    Blender.Draw.Redraw()


def DR_PostProcess():
    global Sposterize, Sfindedges, Sfocalblur, Mpostprod, DpostP0, G_postP0, DpostP1, G_postP1
    global posterize, findedges, focalblur,TpostP0,TpostP1, TpostP2
    global TFadeDistance,TFadePower
    

    TRpostP0=TpostP0+50 
    TRpostP1=TpostP1+50 
    TRpostP2=TpostP2+50 

    winPaint()

    glRasterPos2d(20, 422)
    Text("Megapov post process")

    script=96;Povy=390;megawidth=(script+2)*3;megaheight=16;megax=20;megay=Povy-24;animwidth=script; animheight=16
    animx=40+10; animy=megay-40

    c=[0.85,0.85,0.7,0.2]
    c1=[.1,.0,.0,1.0]

    r=[megax+script/3,megay-15*megaheight, megax+animwidth*3+4, megay-8]
    trace_rectangle3(r,c,c1)

    
    Mpostprod= Menu("Post Process%t| Find Edges %x1| Posterize%x2| Focal Blur%x3", TpostP0-12, megax+animwidth*3+4-150, 376, 150, 18, Mpostprod.val)



    if Mpostprod.val==1:
     
       Sfindedges=Toggle('Find Edges',TpostP0-3, animx-20, animy+20, 
                                         animwidth+int(script*1.65+2), animheight,  Sfindedges.val)

       for r in range(1,len(G_postP0)-2):
             Cr=clean2(G_postP0,r)
             DpostP0[Cr]=Slider( Cr+' ',TpostP0+G_postP0[r][5], 
                                         animx-20, animy-19*(r-1), 
                                         animwidth+int(script*1.65+2), animheight, 
                                         DpostP0[Cr].val, 
                                         G_postP0[r][2],G_postP0[r][3],0,'post process, Find edges: choose the value.' )
                    
             Button("R", TRpostP0+G_postP0[r][5] ,animx+animwidth+int(script*1.65+2)-20, animy-19*(r-1), animwidth/4, animheight ,'Reset')
       
       animy=megay-48
       r=len(G_postP0)-2
       Cr=clean2(G_postP0,r)
       
       if Cr.find('//')!=-1:
          Cr=Cr.replace('//','')
       
       Cl=[' R',' G',' B']
       t=0;c=[DpostP0[Cr+Cl[0]].val,DpostP0[Cr+Cl[1]].val,DpostP0[Cr+Cl[2]].val,0.2]
       c1=[.1,.0,.0,1.0]
       r=[  animx+30,  animy-(r-1)*19, megax+animwidth*2,  animy-(r-1)*19+DpostP0['linear_radius '].val ]
       trace_rectangle3(r,c,c1);r=len(G_postP0)-2

       for n in Cl:
          t+=1
          DpostP0[Cr+n]=Slider( Cr[0:10]+n+' ',TpostP0+G_postP0[r][5], animx-20, 
                                         animy-19*(t+r-1),
                                         animwidth+int(script*1.65+2),
                                         animheight, DpostP0[Cr+n].val, 
                                         G_postP0[r][2][t-1],G_postP0[r][3][t-1],0,'post process, Find edges: choose the value.' )

       Button("R", TRpostP0+G_postP0[r][5] ,animx+animwidth+int(script*1.65+2)-20, animy-19*(r+2), animwidth/4, animheight*3+6 ,'Reset')


    elif Mpostprod.val==2:
       Sposterize=Toggle(' Posterize ',TpostP0-3, animx-20, animy+20, 
                                         animwidth+int(script*1.65+2), animheight,  Sposterize.val)
       r=len(G_postP1)-2
       Cr=clean2(G_postP1,1)
       if Cr.find('//')!=-1:
          Cr=Cr.replace('//','')
       Cl=[' R',' G',' B']
       t=0
       for n in Cl:
          t+=1
          DpostP1[Cr+n]=Slider( Cr[0:10]+n+' ',TpostP1+G_postP1[r][5], animx-20, 
                                         animy-19*(t+r-1),
                                         animwidth+int(script*1.65+2),
                                         animheight, DpostP1[Cr+n].val, 
                                         G_postP1[r][2][t-1],G_postP1[r][3][t-1],0,'post process, posterize: choose the value.' )

       Button("R", TRpostP1+G_postP1[r][5] ,animx+animwidth+int(script*1.65+2)-20, animy-19*(r+2), animwidth/4, animheight*3+6 ,'Reset')

    elif Mpostprod.val==3:
       Sfocalblur=Toggle(' Focal Blur ',TpostP0-3, animx-20, animy+20, 
                                         animwidth+int(script*1.65+2), animheight,  Sfocalblur.val)
       for r in range(1,len(G_postP2)-1):
             Cr=clean2(G_postP2,r)
             DpostP2[Cr]=Slider( Cr+' ',TpostP2+G_postP2[r][5], 
                                         animx-20, animy-19*(r-1), 
                                         animwidth+int(script*1.65+2), animheight, 
                                         DpostP2[Cr].val, 
                                         G_postP2[r][2],G_postP2[r][3],0,'post process, Focal Blur: choose a value.' )
                    
             Button("R", TRpostP2+G_postP2[r][5] ,animx+animwidth+int(script*1.65+2)-20, animy-19*(r-1), animwidth/4, animheight ,'Reset')


    l1="Light win2";l1b=''
    l3="Main Win";l3b=''
    basdepagedraw(l1,l1b,l3,l3b,7)
   
def BE_PostProcess(evt):
      global Mpostprod,  DpostP0,    G_postP0,    DpostP1, G_postP1, posterize, findedges, focalblur
      global Sposterize, Sfindedges, Sfocalblur,  TpostP0, TpostP1, TpostP2
      global TFadeDistance,TFadePower
 
      TRpostP0=TpostP0+50 
      TRpostP1=TpostP1+50 
      TRpostP2=TpostP2+50 

      BasdepageBevent(evt,3,1)

      if (evt==TpostP0-12):
           Blender.Draw.Redraw()
                
      elif (evt==TpostP0-3):
           Blender.Draw.Redraw()
      
      if Mpostprod.val==1:
         for r in range(1,len(G_postP0)-2):
               if (evt==TRpostP0+G_postP0[r][5]):
                  Cr=clean2(G_postP0,r)
                  DpostP0[Cr].val=G_postP0[r][6]
               if (evt==TpostP0+G_postP0[r][5]):
                  Cr=clean2(G_postP0,r)
                  G_postP0[r][1]=DpostP0[Cr].val
         t=0
         r=len(G_postP0)-2
         Cr=clean2(G_postP0,r)
         Cl=[' R',' G',' B']
         if (evt==TRpostP0+G_postP0[len(G_postP0)-2][5]):
               for n in Cl:
                   t+=1
                   DpostP0[Cr+n].val=G_postP0[r][6][t-1]

         if (evt==TpostP0+G_postP0[len(G_postP0)-2][5]):
               for n in Cl:
                   t+=1
                   #print G_postP0[r][1],DpostP0[Cr+n].val
                   G_postP0[r][1][t-1]=DpostP0[Cr+n].val

         Blender.Draw.Redraw()

      elif Mpostprod.val==2:             
         
         r=len(G_postP1)-2
         Cr=clean2(G_postP1,1)
         Cl=[' R',' G',' B']
         t=0
         
         if (evt==TpostP1+G_postP1[len(G_postP1)-2][5]):
           for n in Cl:
              t+=1 #print DpostP1[Cr+n].val
              G_postP1[r][1][t-1]=DpostP1[Cr+n].val

         t=0
         if (evt==TRpostP1+G_postP1[len(G_postP1)-2][5]):
               for n in Cl:
                   t+=1
                   DpostP1[Cr+n].val=G_postP1[r][6][t-1]
         Blender.Draw.Redraw()
  
      elif Mpostprod.val==3:             
         for r in range(1,len(G_postP2)-1):
               if (evt==TRpostP2+G_postP2[r][5]):
                  Cr=clean2(G_postP2,r)
                  DpostP2[Cr].val=G_postP2[r][6]

               if (evt==TpostP2+G_postP2[r][5]):
                  Cr=clean2(G_postP2,r)
                  G_postP2[r][1]=DpostP2[Cr].val
         Blender.Draw.Redraw()
          

def windows(number):
   windownames=["Main", #MAINGUI=1
                "Radiosity", #RADIOSITYGUI=2
                "Photons", #PHOTONSGUI=3
                "Materials", #MATERIALSGUI=4
                "Render", #RENDERGUI=5
                "OtherSettings", #OTHERSSTTINGSGUI=6
                "Paths", #PATHSGUI=7
                "PostProcess" #POSTPROCESSGUI=8
                ]

   
   exec "Register(DR_%s, event, BE_%s)"%(windownames[number-1],windownames[number-1])

def Begin():
  if Blender.Get('filename')=="<memory>":
      name = "Filename problem : %t| Sorry but you have to save the current file before to export anything"  
      result = Blender.Draw.PupMenu(name)
      return
  else:
    print " Now you are on the Graphic User Interface!\n Thanks to use Povanim:) "
    windows(MAINGUI)
	
if __name__=='__main__':
	 Begin()    