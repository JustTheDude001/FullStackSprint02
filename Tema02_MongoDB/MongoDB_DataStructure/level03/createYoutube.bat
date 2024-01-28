
use youtube

db.users.insert({
 _id: 1,
 email: "fakeemail@email.com",
 password: "98h23r81902e0120931hh3",
 user_name: "fakeUser",
 birth_date: ISODate("2023-12-21T20:32:00.00Z"),
 sex: "male",
 postal_code: "gdfuah09",
 videos_ids: [1,2]
})

db.videos.insert({
 _id: 1,
 title: "First Video Title",
 description: "This is a description for a video",
 resolution: [{x: 1920, y: 1080}],
 file_name: "videoFileName",
 video_length_s: 12324,
 thumbnail: "ThisIsA THumbnail",
 reproductions: 123,
 likes_num: 112,
 dislikes_num: 123,
 state: "public",
 user_id: 1,
 publication_date: ISODate("2023-12-21T20:32:00.00Z"),
 labels: ["label1", "label2", "label3"],
 comments: [
	{
	comment_id: 1,
	reply_to_comment_id: 0,
	text: "comment 1 text",
	date: ISODate("2023-12-21T20:32:00.00Z")
	},{
	comment_id: 2,
	reply_to_comment_id: 1,
	text: "comment 2 text",
	date: ISODate("2023-12-21T20:32:00.00Z")
	},{comment_id: 3,
	reply_to_comment_id: 0,
	text: "comment 3 text",
	date: ISODate("2023-12-21T20:32:00.00Z")
	}
 ],
 reactions: [
	{type: "like", user_id: 1, date: ISODate("2023-12-21T20:32:00.00Z")},
	{type: "dislike", user_id: 2, date: ISODate("2023-12-21T20:32:00.00Z")},
	{type: "like", user_id: 3, date: ISODate("2023-12-21T20:32:00.00Z")}
 ],
 playlists_ids:[1,2,5]
})


db.channels.insert({
	_id: 1,
	user_id: 1,
	name: "firstChannel",
	description: "This is the first channel of them all",
	creation_date:  ISODate("2023-12-21T20:32:00.00Z"),
	users_subscribed: [1,2]
})

db.playlists.insert({
	_id: 1,
	name: "FirstPlaylist",
	creation_date:  ISODate("2023-12-21T20:32:00.00Z"),
	state: "public",
	videos_ids: [1,2,3,4]
})

