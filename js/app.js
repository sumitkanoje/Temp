var app = angular.module('ProspectD', ["ngRoute", "ngResource"]);

app.config(function($routeProvider) {
    $routeProvider
    .when("/login", {
        templateUrl : "views/login.html",
		controller : 'LoginController as Ctrl'
    })
    .when("/prospect", {
        templateUrl : "views/prospect.html",
		controller : 'ProspectController as Ctrl'
    })
    .when("/dashboard", {
        templateUrl : "views/d2.html",
		controller : 'DashboardController as Ctrl'
    })
    .when("/social", {
        templateUrl : "views/social.html",
		controller : 'SocialController as Ctrl'
    })
	.when("/match", {
        templateUrl : "views/match.html",
		controller : 'MatchController as Ctrl'
    })
	.otherwise( {
		redirectTo : '/prospect'
	});
});

app.factory('API', function( $resource ) {
  return{
	  name: 'myAPI',
	  version: 'v1',
	  bullets: $resource('http://localhost/prospect/sunburst/bullets.json.php?id=1').query(),
	  //bars: $resource('http://localhost/prospect/sunburst/gchart.json.php?P=1&R=3').query()
  };
});

app.controller('AppController', function($scope, $rootScope, $location){
	$scope.title = "Prospect Dashboard";
	$scope.currentPath = $location.path();
	
	this.test = test;
	
	function test(){
	    console.log('Hi');
	};
	
	
	


});

app.controller('LoginController', function($scope, $rootScope){
	$scope.title = "Prospect Dashboard";


});

app.controller('ProspectController', function($scope, $rootScope, $http, $location){
	$rootScope.user = null;
	$scope.title = "Prospect Dashboard";
	
	
	this.submit = submit;
	
	function submit(selected) {
		$rootScope.user = selected;
		//console.log('called', selected);
		$location.path('/dashboard').search({'q': selected.CONTACT_ID});;
	}
	
	$http( {
			url : 'api/prospects',
			method : "GET"
			
		}).then(function(response) {
			//console.log(response.data);
			$scope.prospects = response.data;
		}, function(error) { // optional
			console.log('prospects loading failed');
	});


});

app.controller('DashboardController', function($scope, API, $rootScope, $resource, $http, $location){
	$scope.title = "Prospect Dashboard";
	$scope.apiName = API.name + API.version;
	//$scope.bullets = API.bullets;
	//$scope.bars = API.bars;
	$scope.selected = $location.search().q;
	this.test = test;
	
	function test(){
	    console.log('Hi');
	}
	
	$http( {
			url : 'api/profile/'+$scope.selected,
			method : "GET"
			/*data : $.param(credentials),
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}*/
		}).then(function(response) {
			//console.log(response.data);
			$scope.profile = response.data;
			
			$http({method: 'GET', url: 'http://localhost/prospect/sunburst/gchart.json.php?P='+$scope.profile.CONTACT_ID+'&R='+$scope.profile.OFFICER_CONTACT_ID}).
                success(function(data, status, headers, config) {
					
					Donut();
					Line();
                }).
                error(function(data, status, headers, config) {
                    console.log('Error loading barchart data');
           });
		   
		   $http({method: 'GET', url: 'http://localhost/prospect/sunburst/bullets.json.php?id='+$scope.profile.CONTACT_ID}).
                success(function(data, status, headers, config) {
		            $scope.bullets = data;
					//console.log(data);
                }).
                error(function(data, status, headers, config) {
                    console.log('Error loading barchart data');
           });
		   
		   $http({method: 'GET', url: 'http://localhost/prospect2/api/traits/'+$scope.profile.CONTACT_ID}).
                success(function(data, status, headers, config) {
		            $scope.traits = data;
					barchart(data);
					//console.log(data);
                }).
                error(function(data, status, headers, config) {
                    console.log('Error loading traits data');
           });
			
			
		}, function(error) { // optional
			console.log('Profile retrieval failed');
	});
	
	
	
	/* Bar dashboard chart */
    function barchart(data){ 
	    Morris.Bar({
        element: 'dashboard-bar-1',
		data: data,
    /*    data: [
            { y: 'Agreeableness', a: 75, b: 35 },
            { y: 'Openness', a: 64, b: 26 },
            { y: 'Harmony', a: 78, b: 39 },
            { y: 'Tradition', a: 82, b: 34 },
            { y: 'Introversion', a: 86, b: 39 },
            { y: 'Emotional Range', a: 94, b: 40 },
            { y: 'Closeness', a: 96, b: 41 }
        ], */
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Customer', 'Relationship Manager'],
        barColors: ['#33414E', '#1caf9a'],
    /*    gridTextSize: '10px', */
        hideHover: true,
        resize: true,
        gridLineColor: '#E5E5E5', 
		horizontal: true,
		stacked: false
    })}
	
	
	function Donut(){
		/* Donut dashboard chart */
        Morris.Donut({
        element: 'dashboard-donut-1',
        data: [
            {label: "Tradition", value: 89},
            {label: "Stimulation", value: 87},
            {label: "Helping others", value: 83},
			{label: "Achievement", value: 65},
			{label: "Taking Pleasure in life", value: 44}
        ],
        colors: ['#33414E', '#1caf9a', '#FEA223', '#0000FF', '#FF0000'],
        resize: true
    })}
	
	function Line(){
		/* Line dashboard chart */
    Morris.Line({
      element: 'dashboard-line-1',
      data: [
        { y: 'Harmony', a: 97,b: 4},
        { y: 'Curiosity', a: 93,b: 6},
        { y: 'Stability', a: 87,b: 6},
        { y: 'Self-expression', a: 87,b: 6},
        { y: 'Closeness', a: 84,b: 6},
        { y: 'Love', a: 82,b: 6},
        { y: 'Liberty', a: 79,b: 6},
        { y: 'Structure', a: 75,b: 6},
        { y: 'Excitement', a: 74,b: 6},
        { y: 'Ideal', a: 66,b: 6},
        { y: 'Challenge', a: 67,b: 6},
        { y: 'Practicality', a: 34,b: 20}
      ],
      xkey: 'y',
      ykeys: ['a'],
      labels: ['Value','Event'],
      resize: true,
      hideHover: true,
	  parseTime: false,
      //xLabels: 'day',
      gridTextSize: '10px',
      lineColors: ['#1caf9a','#33414E'],
      gridLineColor: '#E5E5E5'
    })}



});

app.controller('MatchController', function($scope, API, $rootScope, $resource, $http, $location){
	$scope.title = "Prospect Dashboard";
	$scope.apiName = API.name + API.version;
	//$scope.bullets = API.bullets;
	//$scope.bars = API.bars;
	$scope.selected = $location.search().q;
	this.test = test;
	
	function test(){
	    console.log('Hi');
	}
	
	$http( {
			url : 'api/profile/'+$scope.selected,
			method : "GET"
			/*data : $.param(credentials),
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}*/
		}).then(function(response) {
			//console.log(response.data);
			$scope.profile = response.data;
			
			$http({method: 'GET', url: 'http://localhost/prospect/sunburst/gchart.json.php?P='+$scope.profile.CONTACT_ID+'&R='+$scope.profile.OFFICER_CONTACT_ID}).
                success(function(data, status, headers, config) {
		            //barchart(data);
					$scope.matchings = data;
                }).
                error(function(data, status, headers, config) {
                    console.log('Error loading barchart data');
           });
		   
		   $http({method: 'GET', url: 'http://localhost/prospect/sunburst/bullets.json.php?id='+$scope.profile.CONTACT_ID}).
                success(function(data, status, headers, config) {
		            $scope.bullets = data;
					//console.log(data);
                }).
                error(function(data, status, headers, config) {
                    console.log('Error loading barchart data');
           });
		   
		   
		}, function(error) { // optional
			console.log('Profile retrieval failed');
	});
	
	
	
	/* Bar dashboard chart */
    function barchart(data){ 
	    Morris.Bar({
        element: 'dashboard-bar-1',
		data: data,
    /*    data: [
            { y: 'Agreeableness', a: 75, b: 35 },
            { y: 'Openness', a: 64, b: 26 },
            { y: 'Harmony', a: 78, b: 39 },
            { y: 'Tradition', a: 82, b: 34 },
            { y: 'Introversion', a: 86, b: 39 },
            { y: 'Emotional Range', a: 94, b: 40 },
            { y: 'Closeness', a: 96, b: 41 }
        ], */
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Customer', 'Relationship Manager'],
        barColors: ['#33414E', '#1caf9a'],
    /*    gridTextSize: '10px', */
        hideHover: true,
        resize: true,
        gridLineColor: '#E5E5E5', 
		horizontal: true,
		stacked: false
    })}
	

});

app.controller('SocialController', function($scope, $rootScope){
	$scope.title = "Prospect Dashboard";


});
