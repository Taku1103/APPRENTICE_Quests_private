class Playlist{
    constructor(name){
        this.name = name;
        this.songs = [];
    }

    addSong(song){
        this.songs.push(song)
    }
    
    removeSong(song){
        this.songs.shift(song)
    }
    play(){
        console.log(this.songs[0])
    }
}


let myPlaylist = new Playlist('お気に入りリスト');

myPlaylist.addSong('Lemon');
myPlaylist.addSong('花束');

console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong('Lemon');
console.log(myPlaylist.play()); // 再生中：花束