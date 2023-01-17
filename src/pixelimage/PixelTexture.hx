package pixelimage;
import pixelimage.Pixelimage;

@:structInit
class PixelTexture {
    public var minX: Int;
    public var maxX: Int;
    public var minY: Int;
    public var maxY: Int;
    var width: Int;
    var height: Int;
    var sx: Float;
    var sy: Float;
    public var pixelImage: Pixelimage;
    public function new( pixelImage: Pixelimage, minX: Int = 0, maxX: Int = -1, minY: Int = 0, maxY: Int = -1 ){
        this.pixelImage = pixelImage;
        // maybe add getter setters ??
        if( minX < pixelImage.width && minX > 0 ){
            this.minX = minX;
        } else {
            this.minX = 0;
        }
        if( minY < pixelImage.height && minY > 0 ){
            this.minY = minY;
        } else {
            this.minX = 0;
        }
        if( maxX < pixelImage.width && maxX > 0 ){
            if( maxX < minX ){
                this.maxX = pixelImage.width;
            } else {
                this.maxX = maxX;
            }
        } else {
            this.maxX = pixelImage.width;
        }
        if( maxX < pixelImage.width && maxX > 0 ){
            if( maxX < minX ){
                this.maxX = pixelImage.width;
            } else {
                this.maxX = maxX;
            }
        } else {
            this.maxX = pixelImage.width;
        }
        width  = this.maxX - this.minX;
        height = this.maxY - this.maxY;
        sx = 1/width;
        sy = 1/height;
    }
    // no bounds checking assume is is always within 0 -> 1 for u and v
    public function getARGB( u: Float, v: Float ){
        var x = Std.int( u*sx + minX );
        var y = Std.int( v*sy + minY );
        return pixelImage.getARGB( x, y );
    }
}