# Take a dataframe and relabel any duplicate column names by appending
# (1), (2), etc, as needed. Return a vector whose field names are the
# new names, and the values are the old names. In other words, the
# returned vector can be viewed as a mapping from its field names (which
# are the new variable names proposed for the data frame) to its
# values (which are the existing variable names in the dataframe). The
# dataframe is not actually changed. If desired, it can be updated with
# names(df) <- names(fixed.name.mapping(df)).
fixed.name.mapping <-  function(df){
  oldnames = names(df)
  name.mapping=character()
  for(i in seq_along(oldnames)){
    name.mapping[i] <- oldnames[i];
    if(is.na(name.mapping[oldnames[i]])){
      names(name.mapping)[i] <- oldnames[i];
    } else {
      j <- 2;
      repeat {
        proposed.newname <- paste(oldnames[i],"(",j,")",sep="");
        if(is.na(name.mapping[proposed.newname])) break;
        j <- j+1;
      }
      names(name.mapping)[i] <- proposed.newname;
    }
  }
  name.mapping;
}