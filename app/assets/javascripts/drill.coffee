$ ->
  $("a#box").click (e) ->

    value = $('input#box').val()

    if value == ''
     alert("プレイヤー名を入力していください")
     return
    else
       id = $('.mmbox id').data("hoge-id")
       [x, y] = positionOfNewBlock(e)
       block = $("<div id ='tooltip' class='dot #{value}'
       data-placement='bottom' data-toggle='tooltip' title= #{value} style='left: #{x}px; top: #{y}px;' />").
        draggable({ containment: "parent" }).css({ position: "absolute" })
        $('div#box').append(block)
        block.tooltip('show')

 positionOfNewBlock = (e) ->
  canvas = $('div#box')
  x = 300
  y = 100
  [x, y]

$(document).on 'click', '#tooltip', ->#表示
  $('div#tooltip').each ->
   $(this).tooltip('show')
$(document).on 'click', '#show_name', ->#表示
  $('div#tooltip').each ->
   $(this).tooltip('show')
$(document).on 'click', '#tooltip_edit', ->#表示
  $('div#tooltip_edit').each ->
   $(this).tooltip('show')
$(document).on 'touchend', '#tooltip_edit', ->#表示
   $(this).tooltip('show')
$(document).on 'touchend', '#tooltip', ->#表示
   $(this).tooltip('show')
$(document).on 'touchend', '#tooltip2', ->#表示
   $(this).tooltip('show')
$(document).on 'click', '#show_name_index', ->#表示
 $('div#tooltip2').each ->
   $(this).tooltip('show')

$(document).on 'click', '#showplayer_button_new', ->#表示
 $('div#tooltip').each ->
   $(this).tooltip('show')
$(document).on 'click', '#showplayer_button_edit', ->#表示
 $('div#tooltip_edit').each ->
   $(this).tooltip('show')
$(document).on 'click', '#tooltip_hide', ->#表示
 $('div#tooltip2').each ->
   $(this).tooltip('hide')
 $('div#tooltip').each ->
   $(this).tooltip('hide')
$(document).on 'click', '#acordion', ->#表示
 $('div#tooltip_acordion').each ->
  $(this).tooltip('show')


$(document).on 'dblclick', '#tooltip', ->#削除
  member = $(this).attr('class').split(' ')[1]
  if confirm "#{member}を削除してよろしいですか?"
    $(this).tooltip('hide').remove()
  else


$(document).on 'dblclick', '#tooltip_edit', ->
  member = $(this).attr('class').split(' ')[1]
  if confirm "#{member}を削除してよろしいですか?"
    project_id = $('div#getid').attr("data-hoge-id")
    sheet_id = $(this).attr("class").split(' ')[2]
    $(this).tooltip('hide').remove()
    $.ajax "/project/#{project_id}/sheet/#{sheet_id}", type: "DELETE", data: {sheet_delete: {member: member}}
  else


$(window).load ->
 $('.dot').tooltip('show')
 #とりあえず表示ボタン
 $('div#tooltip_edit').draggable({ containment: "parent" }).css({ position: "absolute" })
 $('div#tooltip').draggable({ containment: "parent" }).css({ position: "absolute" })
 $('#tooltip_before').each ->
   $(this).tooltip('show')






$(document).on 'click', '#box2', ->
  project_id = $('div#getid').attr("data-hoge-id")
  number = $('div#getnumber').attr("data-hoge-id")
  dots = $('.drill_direction').val()
  $('.drill_direction').val ''

  $('div#tooltip').each ->
   x = $('div#tooltip').css("left") #xpx
   y = $('div#tooltip').css("top") #ypx
   member = $('div#tooltip').attr('class').split(' ')[1] #player name
   $(this).tooltip('hide').remove()
   $.post "/project/#{project_id}/sheet", sheet: { x: x, y: y, member: member, project_id: project_id, number: number, dots: dots}, (block_id) ->

  alert("シートを保存しました！")#新規作成＆保存ん
  window.location.href = "/project/#{project_id}/sheet"


$(document).on 'click', 'a#box_editer', (f)->
    value = $('input#box').val()

    if value == ''
     alert("プレイヤー名を入力していください")
     return
    else
       id = $('.mmbox id').data("hoge-id")
       [x, y] = positionOfNewBlock(f)
       block = $("<div id ='tooltip_edit' class='dot #{value}'
       data-placement='bottom' data-toggle='tooltip' title= #{value} style='left: #{x}px; top: #{y}px;' />").
        draggable({ containment: "parent" }).css({ position: "absolute" })
        $('div#box').append(block)
        block.tooltip('show')

 positionOfNewBlock = (f) ->
   canvas = $('div#box')
   x = 300
   y = 100
   [x, y]

$(document).on 'click', '#box_edit', ->
  project_id = $('div#getid').attr("data-hoge-id")
  number = $('div#getnumber').attr("data-hoge-id")
  dots = $('.drill_direction').val()
  $('.drill_direction').val ''

  $('div#tooltip_edit').each ->
   x = $('div#tooltip_edit').css("left") #xpx
   y = $('div#tooltip_edit').css("top") #ypx
   member = $('div#tooltip_edit').attr('class').split(' ')[1] #player name
   sheet_id = $('div#tooltip_edit').attr('class').split(' ')[2] #sheetのid
   $(this).tooltip('hide').remove()

   if sheet_id == 'ui-draggable'
    $.post "/project/#{project_id}/sheet", sheet: { x: x, y: y, member: member, project_id: project_id, number: number, dots: dots}, (block_id) ->

   else
    $.ajax "/project/#{project_id}/sheet/#{sheet_id}", type: "PATCH", data: {sheet: { x: x, y: y, member: member, project_id: project_id, number: number, dots: dots}}
  window.location.href = "/project/#{project_id}/sheet"#新規作成＆保存ん
  #上書き保存

$(document).on 'click', '#drill_print', ->
 numberer = $("div.max_number_get").attr('id')
 number = parseInt numberer, 10

 if number == -1
  alert("まだシートがありません")
 else
  title = $('#show_title').text()
  pdf = new jsPDF('l', 'mm', [250,360])
  drill = []
  $("div.row").each (index) ->
   html2canvas this, onrendered: (canvas) ->
    drillnote = canvas.toDataURL("image/jpeg")
    drill.push(drillnote)

    if index == number
     $.each drill, (i,value) ->
      pdf.addPage() unless i == 0
      pdf.addImage dataURI = value, 'JPEG', 0, 0
      pdf.save title + '.pdf' if i == number


$(document).on 'click', '#number_confirm', ->
  numbers = []
  $("input.number_box").each ->
   number = $(this).val()
   if number < 0
    $(this).css("border": "1px solid red", "color":"red")
    alert("シート番号は0以上の数字である必要があります。")
    numbers = []
    javascript_die()
   else
    numbers.push(number) #配列に新しい番号を入力
#マイナスの数値をはじく
  numbers_x = numbers.filter((x, i, self) ->
   self.indexOf(x) == i and i != self.lastIndexOf(x))#重複したもの


  if numbers_x.length == 0
   project_id = $("div.get_id").attr('id')
   #リクエスト送信処理
   sheet_before = []#変更があるシートを配列に追加
   sheet_after = [] #キー：変更前、中身が変更後のシート番号
   $("input.number_box").each ->
    number_before = $(this).attr('id')
    parseInt(number_before, 10)
    number_after = $(this).val()
    if number_before == number_after
    else
      sheet_before.push(number_before)
      sheet_after.push(number_after)
   $.each sheet_before, (i,value) ->
    number = value
    $.ajax "/project/#{project_id}/sheet/did", type: "get", data:{number:number}#deleteへ
#ここからドリル作成
   $.each sheet_before, (i,value) ->
    number = sheet_after[i]
    dots = $("h4.#{value}").text()

    $("div.#{value}").each ->
     x = $(this).css("left") #xpx
     y = $(this).css("top") #ypx
     member = $(this).attr('class').split(' ')[1] #player name
     $(this).tooltip('hide').remove()

     $.post "/project/#{project_id}/sheet", sheet: { x: x, y: y, member: member, project_id: project_id, number: number, dots: dots}, (block_id) ->
   alert("ページ番号の入れ替えを完了しました！")
   window.location.href = "/project/#{project_id}/sheet"

  else
   $.each numbers_x, (i,value) ->
    $("input.number_box").each ->
     number_a = $(this).val()
     if number_a == value
      $(this).css("border": "1px solid red", "color":"red")
    alert("シート番号##{value}が複数存在しています")

$(document).on 'click', '#drill_print', ->
 numberer = $("div.max_number_get").attr('id')
 number = parseInt numberer, 10

 if number == -1
  alert("まだシートがありません")
 else
  title = $('#show_title').text()
  pdf = new jsPDF('l', 'mm', [250,360])
  drill = []
  $("div.row").each (index) ->
   html2canvas this, onrendered: (canvas) ->
    drillnote = canvas.toDataURL("image/jpeg")
    drill.push(drillnote)

    if index == number
     $.each drill, (i,value) ->
      pdf.addPage() unless i == 0
      pdf.addImage dataURI = value, 'JPEG', 0, 0
      pdf.save title + '.pdf' if i == number


#ここから
$(document).on 'click', '#saisei_kaishi', ->
 gon.sheets_number.forEach (val,index_number,value_number) ->
  gon.sheets_member.forEach (val,index_member,value_member) ->
    x1 = parseInt($("div.#{value_member[index_member]}_#{value_number[index_number]}").css("left"))
    y1 = parseInt($("div.#{value_member[index_member]}_#{value_number[index_number]}").css("top"))
    $("div.#{value_member[index_member]}_saisei").animate {'left':"#{x1}px",'top':"#{y1}px"}, 3500
# おわったら動作
$(document).on 'click', '#tooltip_show', ->#表示
 $('div#tooltip2').each ->
   $(this).tooltip('show')
 gon.sheets_member.forEach (val,index_member,value_member) ->
     x1 = parseInt($("div.#{value_member[index_member]}_1").css("left"))
     y1 = parseInt($("div.#{value_member[index_member]}_1").css("top"))
     $("div.#{value_member[index_member]}_saisei").animate {'left':"#{x1}px",'top':"#{y1}px"}, 0



$(document).on 'click', '#add_player', ->
  name = $('#player_name').val()

  if name == ''
     alert("プレイヤー名を入力していください")
  else
   project_id = $('ul#note_player').attr('class')
   name = $('#player_name').val()
   $('#player_name').val("")
   list = $("<li>#{name}</li>").attr('class', "col-xs-6 col-lg-3 member_name #{name} name_list");
   $('ul#note_player').append(list)
   $.post "/project/#{project_id}/member", member: {project_id: project_id, name: name}, (block_id) ->


$(document).on 'click', '#delete_player', ->
  name = $('#delete_name').val()

  if name == ''
     alert("削除したいプレイヤー名を入力していください")
  else
     project_id = $('ul#note_player').attr('class')
     name = $('#delete_name').val()
     $('#delete_name').val("")
     $(".#{name}").remove()
     $.ajax "/project/#{project_id}/member/1", type: "DELETE", data: {member_delete: {project_id: project_id, name: name}}