require_relative 'picto_view'

class GalleryView < FXScrollWindow

  # attributes set up
  attr_reader :gallery

  # Constructor
  def initialize( p, gallery )
    super( p, :opts => LAYOUT_FILL )
    @gallery = gallery
    FXMatrix.new( self, :opts => LAYOUT_FILL|MATRIX_BY_COLUMNS )
    @gallery.each_picture {|picture| add_pic(picture) }
  end
  
  # layout
  def layout
    contentWindow.numColumns = [width/PictoView::MAX_WIDTH, 1].max
    super
  end

  # add picto view in this gallery
  def add_pic( pic )
    PictoView.new( contentWindow, pic )
  end
  
end