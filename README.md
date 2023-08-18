
# Kiz Moves
Project to help me visualise different transitions in the dance Kizomba.

# Usage
1. Place .diag file i nthe data\source folder
2. Run `.\render.sh <diag filename> #eg. .\render.sh menssaida.diag`

This will output a .svg and .pdf file in the data\rendered directory.

# Compatibility
This code has been tested and confirmed to work on the following platforms:

- macOS (tested on Ventura)

While the code is expected to work on most Unix-like systems, I cannot guarantee its behavior on Windows operating systems.

# Future Work
- Use docker to set up env and make it 100% reproducible
- Add laidiessaida transitions
- Migrate to full graph system with edge and node
    - Be able to repdoduce menssaida and ladiessaida by setting those as the starting nodes
    - Add additional tags to each node like level (difficulty), style (eg. urban)
    - Set colour programatically based on level
- Move to web-app to display these rendered .svg files (cloud?)
- Make web-app interactive so you can set your own starting point (eg. virgula 180) and filter by level (eg. beginner-imprpover only)