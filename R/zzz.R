.onAttach <- function(lib, pkg,...){
  packageStartupMessage(yamarketrWelcomeMessage())
}

#
#

yamarketrWelcomeMessage <- function(){
  # library(utils)
  
  paste0("\n",
         "---------------------\n",
         "Welcome to yamarketr version ", utils::packageDescription("yamarketr")$Version, "\n",
         "\n",
         "Author:   Pavel Mrykin (Head of analytics dept at MediaGuru).\n",
         "Email:    mrykin@mediaguru.ru\n",
         "Facebook: https://facebook.com/mrykin.pavel \n",
         "\n",
         "Type ?yamarketr for the main documentation.\n",
         "The github page is: https://github.com/mrykin/yamarketr/\n",
         "\n",
         "Suggestions and bug-reports can be submitted at: https://github.com/mrykin/yamarketr/issues\n",
         "Or contact: <mrykin@mediaguru.ru>\n",
         "\n",
         "To suppress this message use:  ", "suppressPackageStartupMessages(library(yamarketr))\n",
         "---------------------\n"
  )
}
