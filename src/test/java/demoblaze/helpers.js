function fn() {
  return {
    uniqueUser: function(prefix) {
      var base = prefix || 'sofka';
      var timestamp = new Date().getTime();
      var random = Math.floor(Math.random() * 1000000);
      return base + '_' + timestamp + '_' + random;
    },
    strongPassword: function() {
      return 'SofkaPass123*';
    }
  };
}
