## This program changes all characters in the file 
## name to different character. 
##list all your directories below with comma and quotes
all_dirs=c("/home/aliev/family_gwas/REMOVING_SPACES/dir1",
           "/home/aliev/family_gwas/REMOVING_SPACES/dir2")
## character to be converted
change_from=" "
## character to be converted to
change_to="_"
for (dir1 in all_dirs)
{  files=dir(dir1, full.names=F)
   for (old_file in files)
   {  new_file=gsub(change_from,change_to,old_file)
      if (new_file != old_file) 
      {  command1=paste("mv ", dir1,"/",'"',old_file,'" ',dir1,"/",new_file,sep="")
       
print(command1)

         system(command1)
      }
   }
}
