document.addEventListener("DOMContentLoaded", function(){
    const questions = $('.question-row');                 // Получение объекта каждого вопроса

    $('#draw-btn').on('click', function(){
        ans_sum = calculateAnsSum(questions);             // Количество ответов на каждый вопрос
        var_ans = getVarAns(questions);                   // Количество ответов на каждый из вариантов вопроса
        var_weights = getVarWeights(questions);           // Вес каждого варианта ответа

        console.log(ans_sum);
        console.log(var_ans);
        console.log(var_weights);

        var k = calculateKs(var_ans, ans_sum);

        console.log(k);
    })
});

function calculateKs(var_ans, ans_sum) {
    var k = [];
    var_ans.forEach((val, key) => {
        k[key] = [];
        val.forEach((val2) => {
            k[key].push(val2 / ans_sum[key]);
        });
    });
    return k;
}

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

function getVarWeights(questions){
    let questions_weights = [];
    questions.each(function(){             // Проход по каждому вопросу
        let weights = [];
        $(this).find('.weights').          // Выборка каждого варианта
                each(function(){
                    weights.push($(this).val());
                })
            questions_weights.push(weights);
    })
    return questions_weights;
}