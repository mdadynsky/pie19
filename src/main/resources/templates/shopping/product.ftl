<#macro item name cost age producer>
    <div class="card" style="width: 18rem;">
        <img src="https://cdn1.ozone.ru/s3/multimedia-v/6060630475.jpg" class="card-img-top pt-3" alt="...">
        <div class="card-body">
            <div class="row">
                <div class="col-9"><h4 class="text-danger">${cost}</h4></div>
                <div class="col-3">
                    <span class="badge bg-secondary">${age}</span>
                </div>
            </div>
            <h5 class="card-title">${name}</h5>
            <p class="card-text">${producer}</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
            <a href="#" class="btn btn-success" onclick="addToCard();">В корзину</a>
        </div>
    </div>
</#macro>

<#macro script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function addToCard() {
            axios({
                method: 'get',
                url: '/shopping/add.html',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
                Swal.fire(
                    'Товар добавлен в корзину',
                    'Самокат',
                    'success'
                )
            });
        }
    </script>
</#macro>