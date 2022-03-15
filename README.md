# Watch Laterz - A Movie Watchlist iOS App

## App Features: 

-  **Search:** Search functionality was implemented for users to be able to search for movies through text field input. The OMDB API was used to be able to fetch movie results using an online movie database. Search results in JSON format were then decoded and displayed on a table view as individual cells. 

- **Favorites:** Favorites functionality was implemented so users would be able to add their favorite movies and shows returned from the search query to a favorite list. 
Safari View: Safari view controller implementation was used for users to be able to learn more about movie results by loading a Safari window linked to the IMDB details page for the selected movie. 


- **Delete By Swiping:** Delete by swiping functionality was added to allow users to delete movies from the Favorites list. Delete by swiping works as expected during runs of the application, but there are problems in its functionality when the app is restarted. At times, the movies that were deleted in a previous run of the app reappear in a subsequent run of the app. 


- **Persistence of Data:** Persistence storage was implemented to limited success by adding favorite movies to user defaults storage. However, the implementation of this functionality still requires work since at times the loaded data does not match the user favorites list from a prior session. 

<p align="center">
<img width="400" height="800" src="https://user-images.githubusercontent.com/78060658/158344668-bcfe3d4d-1c12-4997-b9ab-8317b4406d42.gif">
</p>
