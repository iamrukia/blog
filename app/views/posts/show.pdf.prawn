logopath = "public/images/rails.png"
pdf.image logopath
pdf.text("\n")
pdf.text("by rails 3 based rblog system")
pdf.text("http://rblog.heroku.com")
pdf.text("\n\n")

pdf.move_down 70

pdf.font_size 22
pdf.text("Title :   #{@post.title}", :align => :center)
pdf.text("\n\n")
pdf.font_size 16
pdf.text("Content:\n\n   #{@post.content}")


#for page count
pdf.bounding_box([pdf.bounds.right - 50,pdf.bounds.bottom], :width => 60, :height => 20) do
pagecount = pdf.page_count
pdf.text "Page #{pagecount}"
end