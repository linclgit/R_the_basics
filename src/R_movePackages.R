## -----------------------------------------------
## Move R packages from old folder to new folder
## 
## Note: R does not support copy and paste files
## if destination folders do not exist.
## Therefore, create folders before moving files.
## -----------------------------------------------


## 1- Get all the things ready
# the old R folder
old <- "/Library/Frameworks/R.framework/Versions/3.5/Resources/library"
# the new R folder
new <- "/Library/Frameworks/R.framework/Versions/3.6/Resources/library"
# all folders inside the old R folder
# set recursive=TRUE to obtain all nested folders
old.files <- list.dirs (old, full.names = FALSE, recursive = TRUE)
# all folders inside the new R folder
new.files <- list.dirs (new, full.names = FALSE, recursive = TRUE)

## 2- Create empty folders in new library in order to deposit files
# folders not present (= to be created) in new R folder
mv.files <- setdiff (old.files, new.files)
# define full directories to be created
dirs <- paste0 (new, mv.files)
# create folders one by one in new R folder
for (i in 1:length (dirs)) {
  ifelse (!dir.exists (dirs[i]), dir.create(dirs[i], recursive = TRUE), print(i))
}
# Folders are ready, Check
length (list.dirs (new, full.names = TRUE, recursive = TRUE))

## 3- Move files from old to new directories by _rename_ old files
before <- list.files (mv.files, full.names = TRUE, recursive = TRUE)
after <- gsub ("3.5", "3.6", before)
file.rename (before, after) # DONE!!!

## 4- Delete the old R version
unlink ("/Library/Frameworks/R.framework/Versions/3.5/", recursive = TRUE)
