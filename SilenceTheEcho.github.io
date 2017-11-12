<html>

<head>
  <title>Silence the Echo Chamber</title>
</head>

<body>
  <form>
  <h1>Silence the Echo Chamber</h1>
  <h2>User Login</h2>
    <div>
      <input id="email" type="text" placeholder="Email...">
    </div>
    <div>
      <input id="password" type="password" placeholder="Password...">
    </div>
    <div>
      <button id="sign-in">Sign In/Register</button>
      <button id="sign-out">Sign Out</button>
    </div>
  </form>

  <!--Include firebase.js  -->
  <script src="https://www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>

  <!--Configure firebase-->
  <script>
    // Visit https://console.firebase.google.com/project/<your project id>/overview and click on "Add Firebase to your web app"
    var config = {
      apiKey: "<your api key>",
      authDomain: "<your project id>.firebaseapp.com",
      databaseURL: "https://<your project id>.firebaseio.com",
      storageBucket: "<your project id>.appspot.com",
    };
    firebase.initializeApp(config);
  </script>

  <!--Handle auth events-->
  <script>
    firebase.auth().onAuthStateChanged(function(user) {
      window.user = user;
      // Step 1:
      //  If no user, sign in anonymously with firebase.auth().signInAnonymously()
      //  If there is a user, log out out user details for debugging purposes.
    });
  </script>

  <!--Handle page events-->
  <script>
    document.querySelector('#sign-in').addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      var email = document.querySelector('#email').value;
      var password = document.querySelector('#password').value
      var credential = firebase.auth.EmailAuthProvider.credential(email, password);
      var auth = firebase.auth();
      var currentUser = auth.currentUser;

      // Step 2
      //  Get a credential with firebase.auth.emailAuthProvider.credential(emailInput.value, passwordInput.value)
      //  If there is no current user, log in with auth.signInWithCredential(credential)
      //  If there is a current user an it's anonymous, atttempt to link the new user with firebase.auth().currentUser.link(credential)
      //  The user link will fail if the user has already been created, so catch the error and sign in.
    });

    document.querySelector('#sign-out').addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      firebase.auth().signOut();
    });
  </script>

</body>

</html>