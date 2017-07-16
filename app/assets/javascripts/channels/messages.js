/**
 * Created by aspid on 11.07.17.
 */
App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<p> " +
            "<strong> <a href=\"" + data.user_chatroom + "\">" +
            data.user + "</a> </strong>" +
            data.message + "</p>";
    }
});
