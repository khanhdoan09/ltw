// $("#nav-history-customer").click((e) => {
//     e.preventDefault()
//     $(".screen-custoner").css("display", "none")
//     $("#history-customer").css("display", "block")
//     $.ajax(
//         {
//             url: `/project_war/purchaseHistory`,
//             type: 'POST',
//             success: function (result) {
//                 let arrHistory = JSON.parse(result)
//                 let re = ""
//                 console.log(arrHistory)
//                 for(var k in arrHistory) {
//                     re += `<tr>
//                         <td>
//                             <p>`+arrHistory[k].productName+`</p>
//                                                         </td>
//                                                         <td>
//                                                             <img  alt="">
//                                                         </td>
//                                                         <td>
//                                                             <p>`+arrHistory[k].productQuantity+`</p>
//                                                         </td>
//                                                                   <td>
//                                                                       <p>`+arrHistory[k].productSize+`</p>
//                                                                   </td>
//                                                                   <td>
//                                                                       <p>`+arrHistory[k].createAt+`</p>
//                                                                   </td>
//                                                         <td>
//                                                             <p>`+arrHistory[k].productPrice*arrHistory[k].productQuantity+`</p>
//                                                         </td>
//                                         </tr>`
//                 }
//
//                 $("#table-history").append(re)
//             }
//         }
//     );
// })