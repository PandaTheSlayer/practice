document.addEventListener("DOMContentLoaded", function(){
    $('#draw-btn').on('click', function(){
        console.log(calculateAnsSum());
    })
});

function calculateAnsSum() {
    var questions = $('.question-row');                 // Получение объекта каждого вопроса
    var ans_qt = [];                    
    questions.each(function(i, elem){
        var ans = 0;
        $(this).find('.answers')                        // Поиск значения количества ответов
                .each(function(i, elem){
                    ans = ans + parseInt($(this).val());
        });
        ans_qt.push(ans);
    })
    return ans_qt;
}

