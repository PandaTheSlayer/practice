document.addEventListener("DOMContentLoaded", function(){
    const questions = $('.question-row');                 // Получение объекта вопросов
        

    $('#draw-btn').on('click', function(){
        let ans_sum = calculateAnsSum(questions),                        // Количество ответов на каждый вопрос
            questions_name = getQuestionsName(questions),                // Получить список вопросов
            var_ans = getVarAns(questions),                              // Количество ответов на каждый из вариантов вопроса
            var_weights = getVarWeights(questions),                      // Вес каждого варианта ответа
            k = calculateKs(var_ans, ans_sum),                           // Соотношение количества ответов на каждый из вариантов 
            S = calculateS(questions, var_ans, var_weights, k, ans_sum); // Общий вес каждого вопроса

        let dataSet = createDataSet(questions_name, S);

        
        drawGraph(dataSet);

        // console.log(ans_sum);
        // console.log(var_ans);
        // console.log(var_weights);
        // console.log(k);
    })
});


function drawGraph(dataSet){
    
    // Вершины графа
    var nodesArr = [];
    nodesArr.push(
        {id: 0, label: "Итоговая оценка за модуль", shape: "box", size: 250, font: {
            size: 20
        }}
    );
    
    dataSet.forEach( (elem, i) => {
        nodesArr.push({
            id: i+1,
            label: "Вопрос " + Number(i+1),
            shape: "ellipse"
        })
    });

    var nodes = new vis.DataSet(nodesArr);
    

    // Ребра графа
    var edges_tmp = [];
    dataSet.forEach( (elem, i) => {
        edges_tmp.push({
            from: i+1,
            to: 0,
            label: dataSet[i]['weight']
        })
    });
    
    var edges = new vis.DataSet(
        // {from: 1, to: nodesArr[0].id, label: '0.6504'},
        // {from: 2, to: nodesArr[0].id},
        // {from: 3, to: nodesArr[0].id},
        // {from: 4, to: nodesArr[0].id},
        // {from: 5, to: nodesArr[0].id}
        edges_tmp
    );
    console.log(edges);
    // create a network
    var container = document.getElementById('myNetwork');

    // provide the data in the vis format
    var data = {
        nodes: nodes,
        edges: edges
    };
    var options = {
        locale: 'ru',
        nodes: {
            shape: 'ellipse',
            size: 150,
            mass: 1
        },
        physics: false
    };

    // initialize your network!
    var network = new vis.Network(container, data, options);
}


function createDataSet(questions_name, S) {
    let dataSet = [];
    for (let i = 0; i < questions_name.length; i++) {
        
        let tmp = {};
        let question_name = questions_name[i];
        let weight = S[i];
        tmp.question_name = question_name;
        tmp.weight = weight;
        dataSet.push(tmp);

    }
    return dataSet;
}

function getQuestionsName(questions) {
    let questions_name = [];
    questions.each(function () {
        questions_name.push($(this).find('.question_name').html());
    });
    return questions_name;
}

function calculateS(questions, var_ans, var_weights, k, ans_sum){
    let S = [];
    for(let i = 0; i < var_ans.length; i++){
        let tmp = [];
        for(let j = 0; j < var_ans[i].length; j++){
            tmp.push( (var_ans[i][j] * var_weights[i][j] * k[i][j])/ans_sum[i] );
        }
        S.push( tmp.reduce((acc, item) => acc + item).toFixed(4) );
    }
    return S;
}

function calculateKs(var_ans, ans_sum) {
    let k = [];
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