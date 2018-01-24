document.addEventListener("DOMContentLoaded", function(){
    const questions = $('.question-row');                 // Получение объекта каждого вопроса

    $('#draw-btn').on('click', function(){
        ans_sum = calculateAnsSum(questions);             // Получаем массив сумм ответов на каждый из вопросов
        //console.log(ans_sum);
        console.log(getVarAns(questions));
    })
});

function calculateAnsSum(questions) {

    let ans_sum = [];                    
    questions.each(function(i, elem){
        let ans = 0;
        $(this).find('.answers')                          // Поиск значения количества ответов
                .each(function(i, elem){
                    ans = ans + parseInt($(this).val());
        });
        ans_sum.push(ans);
    })
    return ans_sum;
}

function getVarAns(questions){
    let questions_ans = [];
    questions.each(function(){             // Проход по каждому вопросу
        let ans = [];
        $(this).find('.answers').          // Выборка каждого варианта
                each(function(){
                    ans.push($(this).val());
                })
            questions_ans.push(ans);
    })
    return questions_ans;
}