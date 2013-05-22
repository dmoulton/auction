function google_plus_sign_in_render() {
    angular.element($('#signinButton')).scope().render();
}

app.directive('google', function ($http) {
    return {
        restrict: 'A',
        scope: {
            authenticated: '=authenticated'
        },
        controller: function ($scope, $attrs) {
            // Load the SDK Asynchronously
            (function () {
                var po = document.createElement('script');
                po.type = 'text/javascript';
                po.async = true;
                po.src = 'https://apis.google.com/js/client:plusone.js?onload=google_plus_sign_in_render';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(po, s);
            })();

            function fetch() {
                $http.post('/google/fetch', $scope.auth
                    ).success(function (data) {
                        //window.location.reload(true);
                        $scope.fetch_status = data.status;
                        if (data.status == 'verified') {
                            $scope.authenticated = true
                        }
                        else {
                            alert('You are not an authorized user')
                        }
                    }).error(function (data) {
                        //console.log('error: ' + data);
                        $scope.fetch_status = data.status;
                    });
            }

            $scope.render = function () {
                gapi.signin.render('signinButton', {
                    callback: function (authResult) {
                        if (authResult['access_token']) {
                            //console.log('google success');
                            $scope.auth = authResult

                            // Successfully authorized
                            // Hide the sign-in button now that the user is authorized, for example:
                            //document.getElementById('signinButton').setAttribute('style', 'display: none');
                            $scope.login_status = 'connected'
                            fetch()
                        } else if (authResult['error']) {
                            // There was an error.
                            // Possible error codes:
                            //   "access_denied" - User denied access to your app
                            //   "immediate_failed" - Could not automatially log in the user
                            //console.log('There was an error: ' + authResult['error']);
                            $scope.login_status = authResult['error'];
                        }
                        $scope.$apply();
                    },
                    clientid: gon.client_id,
                    cookiepolicy: "single_host_origin",
                    // requestvisibleactions: "http://schemas.google.com/AddActivity",
                    scope: "https://www.googleapis.com/auth/userinfo.email"
                });
            }

            $scope.revoke = function () {
                console.log('revoke');
                var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' +
                    $scope.auth['access_token'];

                $.ajax({
                    type: 'GET',
                    url: revokeUrl,
                    async: false,
                    contentType: "application/json",
                    dataType: 'jsonp',
                    success: function (nullResponse) {
                        console.log('disconnected');
                        // Do something now that user is disconnected
                        // The response is always undefined.
                        $scope.login_status = 'disconnected'
                        $scope.authenticated = false
                        $scope.$apply();
                    },
                    error: function (e) {
                        console.log('error in revoke');
                        // Handle the error
                        console.log(e);
                        // You could point users to manually disconnect if unsuccessful
                        // https://plus.google.com/apps
                    }
                });
            }
        },
        link: function (scope, element, attrs, controller) {
        }
    }
});