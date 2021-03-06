tag App
  def setup
    @text = "Hello, world!"

  def rot(n)
    @text.replace /[a-z]/gi do |c|
      let i = c.charCodeAt(0)
      if i >= 97 and i <= 122
        String.fromCharCode(((i - 97 + n) % 26) + 97)
      else if i >= 65 and i <= 90
        String.fromCharCode(((i - 65 + n) % 26) + 65)
      else
        c

  def upload(event)
    let file = event.native:target:files[0]
    return unless file
    let reader = FileReader.new

    reader:onload = do |event|
      @text = event:target:result
      @error = nil
      Imba.commit
    reader.read-as-text(file)

  def render
    <self>
      <div.contents>
        <header>
          "ROT-N"
        <textarea[@text]>
        <div>
          <input#file type="file" :change.upload>
        <table>
        for i in [1..25]
          <tr .{"rot-{i}"}>
            <th>
              i
            <td>
              rot(i)

Imba.mount <App>
