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
$(document).on 'click', '#tooltip_show', ->#表示
 $('div#tooltip2').each ->
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
  alert("シートの変更が完了しました！")#新規作成＆保存ん
  #上書き保存


#シートナンバー変更
#$(document).on 'click', '#number_confirm', ->