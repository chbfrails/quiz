// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor/jquery-migrate-1.1.1.min.js
//= require bootstrap-sprockets
//= require vendor/angular.min.js
//= require vendor/angular-sanitize.min.js
//= require vendor/textAngular-rangy.min.js
//= require vendor/textAngular-sanitize.min.js
//= require vendor/textAngular.min.js
//= require vendor/ngDialog.min.js
//= require vendor/jvfurigana.plugin.min.js
//= require vendor/xregexp-all-min.js
//= require vendor/flipclock.min.js

var app = angular.module('App', ['ngSanitize', 'textAngular', 'ngDialog']);

app.filter("trust", ['$sce', function ($sce) {
  return function (htmlCode) {
    return $sce.trustAsHtml(htmlCode);
  }
}]);

app.controller('ExamCtrl', ['$scope', '$timeout', function ($scope, $timeout) {

  $(document).ready(function () {
    $("p").JVFurigana();
  });

  // exam data
  var div = document.getElementById('div-item-data');
  $scope.examdata = JSON.parse(div.getAttribute("data-exam"));

  $scope.score = 0;
  $scope.max_score = 0;

  $scope.vocab_score = 0;
  $scope.max_vocab_score = 0;

  $scope.kanji_score = 0;
  $scope.max_kanji_score = 0;

  $scope.grammar_score = 0;
  $scope.max_grammar_score = 0;

  $scope.listening_score = 0;
  $scope.max_listening_score = 0;

  // answer data
  $scope.answerdata = [];
  angular.forEach($scope.examdata, function (value, key) {
    $scope.answerdata.push({
      question_id: value.id,
      answer_id: 0
    });

    if (value.qtype == 1) {
      $scope.max_vocab_score += 1;
    } else if (value.qtype == 2) {
      $scope.max_kanji_score += 1;
    } else if (value.qtype == 3) {
      $scope.max_grammar_score += 1;
    } else if (value.qtype == 4) {
      $scope.max_listening_score += 1;
    }

    $scope.max_score = $scope.max_vocab_score + $scope.max_kanji_score + $scope.max_grammar_score + $scope.max_listening_score;
  });

  $scope.validateAnswers = false;
  $scope.toogledebug = false;
  $scope.solution = false;
  $scope.unanswerquestion = "All of question were not answer.";

  $scope.validateExam = function () {

    $scope.unanswerquestion = "";
    $scope.validateAnswers = true;

    angular.forEach($scope.answerdata, function (value, key) {
      if (value.answer_id == 0) {
        $scope.validateAnswers = false;
        $scope.unanswerquestion = $scope.unanswerquestion + "#" + (key + 1) + ", ";
      }
    });

    // Cut last character
    $scope.unanswerquestion = $scope.unanswerquestion.substring(0, $scope.unanswerquestion.length - 2);

    if ($scope.validateAnswers) {
      angular.forEach($scope.examdata, function (question, key1) {
        angular.forEach(question.answers, function (answer, key2) {
          angular.forEach($scope.answerdata, function (exam_answer, key3) {
            if (question.id == exam_answer.question_id && exam_answer.answer_id == answer.id && answer.correct) {
              $scope.score += 1;
              if (question.qtype == 1) {
                $scope.vocab_score += 1;
              } else if (question.qtype == 2) {
                $scope.kanji_score += 1;
              } else if (question.qtype == 3) {
                $scope.grammar_score += 1;
              } else if (question.qtype == 4) {
                $scope.listening_score += 1;
              }
            }
          });
        });
        $scope.score = $scope.vocab_score + $scope.kanji_score + $scope.grammar_score + $scope.listening_score;
      });
    }

  };

  $scope.counter = 60 * 6;

  clock = new FlipClock($('.clock'), $scope.counter, {
    clockFace: 'Counter'
  });

  //$scope.onTimeout = function () {
  //  $scope.counter--;
  //  clock.decrement();
  //  mytimeout = $timeout($scope.onTimeout, 1000);
  //  if ($scope.counter == 0) {
  //    $timeout.cancel(mytimeout);
  //    $scope.solution = true;
  //
  //    alert("Time up!");
  //
  //    angular.forEach($scope.examdata, function (question, key1) {
  //      angular.forEach(question.answers, function (answer, key2) {
  //        angular.forEach($scope.answerdata, function (exam_answer, key3) {
  //          if (question.id == exam_answer.question_id && exam_answer.answer_id == answer.id && answer.correct) {
  //            $scope.score += 1;
  //            if (question.qtype == 1) {
  //              $scope.vocab_score += 1;
  //            } else if (question.qtype == 2) {
  //              $scope.kanji_score += 1;
  //            } else if (question.qtype == 3) {
  //              $scope.grammar_score += 1;
  //            } else if (question.qtype == 4) {
  //              $scope.listening_score += 1;
  //            }
  //          }
  //        });
  //      });
  //      $scope.score = $scope.vocab_score + $scope.kanji_score + $scope.grammar_score + $scope.listening_score;
  //    });
  //
  //    $("#notfinish").hide();
  //
  //  }
  //};
  //var mytimeout = $timeout($scope.onTimeout, 1000);

  // Navigate between pane
  $(function () {
    $('.btn-circle').on('click', function () {
      $('.btn-circle.btn-info').removeClass('btn-info').addClass('btn-default');
      $(this).addClass('btn-info').removeClass('btn-default').blur();
    });
    $('.next-step, .prev-step').on('click', function (e) {
      var $activeTab = $('.tab-pane.active');
      $('.btn-circle.btn-info').removeClass('btn-info').addClass('btn-default');
      if ($(e.target).hasClass('next-step')) {
        var nextTab = $activeTab.next('.tab-pane').attr('id');
        $('[href="#' + nextTab + '"]').addClass('btn-info').removeClass('btn-default');
        $('[href="#' + nextTab + '"]').tab('show');
        $("html, body").animate({
          scrollTop: 0
        }, 400);
      } else {
        var prevTab = $activeTab.prev('.tab-pane').attr('id');
        $('[href="#' + prevTab + '"]').addClass('btn-info').removeClass('btn-default');
        $('[href="#' + prevTab + '"]').tab('show');
        $("html, body").animate({
          scrollTop: 0
        }, 400);
      }
    });
  });

}]);

app.controller('QuestionCtrl', ['$scope', '$http', 'ngDialog'
  , function ($scope, $http, ngDialog) {

    $(document).ready(function () {
      $("body").JVFurigana();
    });

    // exam data
    var div = document.getElementById('div-data');
    $scope.examdata = JSON.parse(div.getAttribute("data-exam"));
    $scope.deletepath = div.getAttribute("data-delete-path");

    $scope.deleteQuestion = function (question_id) {

      $scope.postdata = {
        question_id: parseInt(question_id)
      };

      $http.post($scope.deletepath, $scope.postdata).then(function () {
        location.reload();
      }, function () {
        ngDialog.open({
          template: 'deletedNotSuccess',
          showClose: false,
          closeByEscape: false,
          closeByNavigation: false,
          closeByDocument: false
        });
      });

    }


  }]);

app.controller('NewQuestionCtrl', ['$scope', '$http', 'ngDialog',
  function ($scope, $http, ngDialog) {

    var div = document.getElementById('div-data');
    $scope.path = div.getAttribute("data-path");
    $scope.redirect_path = div.getAttribute("data-redirect-path");

    $scope.postdata = {
      question: "<p>This is <abbr>default</abbr> text.</p>",
      question_type: 1,
      question_level: 4,
      answers: [{answer: "This is default answer.", correct: true}]
    };

    $scope.addAnswer = function () {

      $scope.postdata.answers.push({answer: "This is default answer.", correct: false});

    };

    $scope.removeAnswer = function (index) {

      if (index > -1) {
        $scope.postdata.answers.splice(index, 1);
      }

    };

    $scope.createNewQuestion = function () {

      // Check Blah Blah Blah
      $http.post($scope.path, $scope.postdata).then(function () {
        alert('Added');
      }, function () {
        alert('Error');
      });

    };

    $scope.$on('ngDialog.opened', function (e, $dialog) {
      $('body').addClass('modal-open')
    });

    $scope.$on('ngDialog.closing', function (e, $dialog) {
      $('body').removeClass('modal-open');
      window.location.replace($scope.redirect_path);
    });

  }
]);

app.controller('EditQuestionCtrl', ['$scope', '$http', 'ngDialog',
  function ($scope, $http, ngDialog) {

    var div = document.getElementById('div-data');
    $scope.path = div.getAttribute("data-path");
    $scope.redirect_path = div.getAttribute("data-redirect-path");
    $scope.question = JSON.parse(div.getAttribute("data-question"));

    // init data
    $scope.postdata = {
      question: $scope.question.name,
      question_type: $scope.question.qtype,
      question_level: $scope.question.test_level,
      answers: $scope.question.answers
    };

    $scope.addAnswer = function () {

      $scope.postdata.answers.push({id: 0, name: "This is default answer.", correct: false});

    };

    $scope.removeAnswer = function (index, answer) {

      if (answer.id != 0) {
        answer.markdelete = true;
      } else {
        $scope.postdata.answers.splice(index, 1);
      }

    };

    $scope.editQuestion = function () {

      // Check Blah Blah Blah
      $http.put($scope.path, $scope.postdata).then(function () {
        alert('Edited');
      }, function () {
        alert('Error');
      });

    };

    $scope.$on('ngDialog.opened', function (e, $dialog) {
      $('body').addClass('modal-open');
      $('.scrollup').hide();
    });

    $scope.$on('ngDialog.closing', function (e, $dialog) {
      $('body').removeClass('modal-open');
      window.location.replace($scope.redirect_path);
    });

  }
]);

// non-angular
$(window).scroll(function () {
  if ($(this).scrollTop() > 100) {
    $('.scrollup').fadeIn(400);
  } else {
    $('.scrollup').fadeOut(400);
  }
});

$('.scrollup').click(function () {
  $("html, body").animate({
    scrollTop: 0
  }, 400);
  return false;
});