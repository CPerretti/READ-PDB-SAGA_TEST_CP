p(paste0("On this tab, the user selects the strata, species, season, years, lengths and ages for which they would like "
         ," the application to develop indices from the NEFSC bottom trawl survey. Users can also choose to apply calibrations or different combinations "
         ," of SHG codes. "),
  h4("Select strata"),
  p(paste0("Select one or more finfish strata from the window on the left (multiple strata may be selected by click and draggging the mouse or "
           ," by holding the CTRL button. Once the desired strata are selected "
           ," click the right arrow to add the strata to the window on the right. The strata in the window on the "
           ," right will be used to build survey indices. Strata may also be removed by selecting "
           ," them from the window on the right and clicking the left arrow. ")),
  h4("Select species"),
  p(paste0("Any of the species in this drop down menu are available. Click on a species and that species will show "
           ," in the 'select species' field indicating it has been selected. ")),
  h4("Choose season"),
  p(" Indices can be built from either the fall or spring NEFSC bottom trawl survey. Click the button corresponding to the desired season."),
  h4("Select rance of years"),
  p(" Use the slider to slect a range of years over which to build survey indices. "),
  h4("Select range of length and age"),
  p(paste0(" The sliders for length and age will automatically generate bounds based on the minimum and maximum"
           ," observed for the slected species. The range of lengths and ages can be further restricted by moving "
           ," the sliders. ")),
  h4("SHG values"),
  p(paste0(" SHG values are used to assess the quality of each survey tow. "
           ," S stands for station value. It is a code designating the type of tow (random vs. nonrandom, e.g.). An "
           ," S value of 1 indicates a random tow. "
           ," H stands for haul value. It designates the relative success of the haul. H <= 3 indicates a tow "
           ," that was probably not problematic enough to be unrepresentative of the stock in the area fished. "
           ," G stands for gear value. It designates the condition of the gear after each tow. G <= 6 indicates "
           ," problems not serious enough to make the tow unrepresentative. More detailed definitions can be found "
           , "in the Data Dictionary.")),
  h4("Bigelow calibration"),
  p(paste0(" Select this to include species and potentially length based (if available) calibrations based on the switch "
           ," from the RV Albatross to the RV Bigelow in 2009. ")),
  h4("Gear/Door/Vessel calibration"),
  p(paste0(" Check this box to include standard calibrations done to account for changes in vessel and/or gear over time.")),
  h4("Run"),
  p("When the inputs above are set, press the run button to develop your survey indices. " 
    ," A plot of the indices by year will appear when the application is finished. You can change the inputs and "
    ," hit the run button again to develop new indices based on the slected inputs."),
  h4("Download .csv Data"),
  p(paste0(" Click this buttom once the plot of the indices has been displayed to download the survey indices in .csv "
           ," format. The file will include indices at length, age and by strata, as well as the inputs selected.")),
  p(paste0("Please note that the column at the far right of the indices at length is the total across the selected"
           ,"size and age range.")),
  em(strong("*The overall indices are for all available sizes and ages.*")),
  h4("Download Rdata"),
  p(paste0(" Click this buttom once the plot of the indices has been displayed to download the survey indices as "
           ," an Rdata object. The resulting file can be read using load() in R. It will load an object called "
           ," SAGAr into memory that will contain "
           ," indices at length, age and by strata, as well as the inputs selected. Use str(SAGAr) to see the "
           ," data structures. ")),
  br(),
  br(),
  
  h2("Maps"),
  p("The maps tab will generate a map based on the inputs from the Survey Indices tab."),
  h4("Download html"),
  p(paste0("This button will cause an html version of the map to be downloaded to the'Downloads' directory. "
           ," The html map can be opened in a browser and will remain interactive. A pdf of the map after "
           ," manipulation can be saved using the browsers 'File/Export to pdf' function. ")