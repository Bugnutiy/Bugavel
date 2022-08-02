<form action="/admin/properties/add/form" method="POST">
    <p><input type="text" name="tname" placeholder="Название свойств" required></p>
    <label id="copy" value="Name">
        <input type="text" name="field_name[]" placeholder="Название поля" required>
        <label for="">Тип данных:
            <select name="data_type[]" id="">
                <option value="VARCHAR(100)">Текст 100симв.</option>
                <option value="INT">Целые числа</option>
                <option value="FLOAT">Дробные</option>
                <option value="DECIMAL(19,2)">Дробные, 2 знака после зап.</option>
                <option value="DECIMAL(19,3)">Дробные, 3 знака после зап.</option>
                <option value="BOOLEAN">Да/Нет</option>
            </select>
        </label>
        <label for="">Тип фильтра
            <select name="filter_type[]" id="">
                <option value="checkbox">Множественный выбор</option>
                <option value="radio">Одиночный выбор</option>
                <option value="limit">Значения от-до</option>
                <option value="bool">Да/Нет</option>
            </select>
        </label>
        <label for="">Может быть пустым
            <select name="NULL[]" id="">
                <option value="NOT NULL">НЕТ</option>
                <option value="NULL">ДА</option>

                <!-- <option value="bool"></option> -->
            </select>
        </label>
    </label>
    <label for="">Отличительный признак <input type="radio" name="different" value="0"></label>
    <p id="paste0"></p>
    <input type="button" onclick="addInput()" value="+"></input>
    <p>
        <label>Цена <input type="checkbox" name="additions[]" value="price" checked id=""> </label>
        <label>Количество <input type="checkbox" name="additions[]" value="quantity" checked id=""> </label>
    </p>
    <input type="submit" value="Отправить">
</form>


<script>
    var x = 0;

    function addInput() {
        var str;
        str = '<br>' + document.getElementById('copy').outerHTML + ' <label for="">Отличительный признак <input type="radio" name="different" value="' + (x + 1) + '"></label>' + '<div id="paste' + (x + 1) + '"></div>';
        document.getElementById('paste' + x).outerHTML = str;
        x++;
    }
</script>